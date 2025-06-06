
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kino_app/data/response/movie_response.dart';

import '../data/repository/repositories.dart';
import 'base_controller.dart';

class TopRatedMoreController extends BaseController {
  final TopRatedMoreRepository repository;

  TopRatedMoreController({required this.repository});

  ScrollController? scrollController;
  int _topRatedPage = 1;
  int? _totalTopRatedPage = 1;
  bool _hasNextTopRated = true;
  final RxBool _isTopRatedLoading = false.obs;
  final List<Movie> _topRatedMovies = [];

  @override
  void onInit() async {
    await getTopRatedMovies();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        getTopRatedMovies();
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Future<void> getTopRatedMovies() async {
    if (!_hasNextTopRated) return;
    if (_topRatedPage == 1) {
      setLoading(true);
    } else {
      _isTopRatedLoading.value = true;
    }
    final result = await repository.getTopRatedMovies(page: _topRatedPage);
    _isTopRatedLoading.value = false;
    setLoading(false);
    if (result is MovieResponse) {
      _totalTopRatedPage = result.totalPages;
      _topRatedPage++;
      if (_topRatedPage > _totalTopRatedPage!) _hasNextTopRated = false;
      _topRatedMovies.addAll(result.movies!);
      update();
    } else {
      log('===================> error: $result');
    }
  }

  List<Movie> get topRatedMovies => _topRatedMovies;

  RxBool get isTopRatedLoading => _isTopRatedLoading;
}
