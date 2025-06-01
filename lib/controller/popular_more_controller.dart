import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kino_app/data/response/movie_response.dart';

import '../data/repository/repositories.dart';
import 'base_controller.dart';

class PopularMoreController extends BaseController {
  final PopularMoreRepository repository;

  PopularMoreController({required this.repository});

  ScrollController? scrollController;

  int _popularPage = 1;
  int? _totalPopularPage = 1;
  bool _hasNexPopular = true;
  final RxBool _isPopularLoading = false.obs;
  final List<Movie> _popularMovies = [];

  @override
  void onInit() async {
    await getPopularMovies();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        getPopularMovies();
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Future<void> getPopularMovies() async {
    if (!_hasNexPopular) return;

    if (_popularPage == 1) {
      setLoading(true);
    } else {
      _isPopularLoading.value = true;
    }

    final result = await repository.getPopularMovies(page: _popularPage);
    _isPopularLoading.value = false;
    setLoading(false);
    if (result is MovieResponse) {
      _totalPopularPage = result.totalPages;
      _popularPage++;
      if (_popularPage > _totalPopularPage!) _hasNexPopular = false;
      _popularMovies.addAll(result.movies!);
      update();
    } else {
      log('===================> error: $result');
    }
  }

  List<Movie> get popularMovies => _popularMovies;

  RxBool get isPopularLoading => _isPopularLoading;
}
