import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kino_app/data/response/movie_response.dart';

import '../data/repository/repositories.dart';
import 'base_controller.dart';

class NowPlayingMoreController extends BaseController {
  final NowPlayingMoreRepository repository;

  NowPlayingMoreController({required this.repository});

  ScrollController? scrollController;

  final List<Movie> _nowPlayingMovies = [];
  bool _hasNextNowPlaying = true;
  final RxBool _isNowPlayingLoading = false.obs;
  int _nowPlayingPage = 1;
  int? _totalNowPlayingPage = 1;

  @override
  void onInit() async {
    await getNowPlayingMovies();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        getNowPlayingMovies();
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Future<void> getNowPlayingMovies() async {
    if (!_hasNextNowPlaying) return;
    if (_nowPlayingPage == 1) {
      setLoading(true);
    } else {
      _isNowPlayingLoading.value = true;
    }
    final result = await repository.getNowPlayingMovies(page: _nowPlayingPage);
    _isNowPlayingLoading.value = false;
    setLoading(false);
    if (result is MovieResponse) {
      _totalNowPlayingPage = result.totalPages;
      _nowPlayingPage++;
      if (_nowPlayingPage > _totalNowPlayingPage!) _hasNextNowPlaying = false;
      _nowPlayingMovies.addAll(result.movies!);
      update();
    } else {
      log('===================> error: $result');
    }
  }

  List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  RxBool get isNowPlayingLoading => _isNowPlayingLoading;
}
