import 'dart:developer';

import 'package:kino_app/data/response/cast_response.dart';
import 'package:kino_app/data/response/movie_detail.dart';
import 'package:kino_app/data/response/movie_image.dart';
import 'package:kino_app/data/response/trailer_response.dart';

import '../data/repository/repositories.dart';
import 'base_controller.dart';

class MovieDetailController extends BaseController {
  final MovieDetailRepository repository;

  MovieDetailController({required this.repository});

  MovieDetail? _movieDetail;
  int? movieId;

  void setMovieId(int? value) async {
    movieId = value;
    await getMovieDetail();
    await getMovieCastList();
    await getMovieScreenshots();
    await getMovieTrailerId();
  }

  Future<void> getMovieDetail() async {
    setLoading(true);
    final result = await repository.getMovieDetail(movieId: movieId);
    setLoading(false);
    if (result is MovieDetail) {
      _movieDetail = result;
      update();
    } else {
      log('===================> error: $result');
    }
  }

  Future<void> getMovieScreenshots() async {
    setLoading(true);
    final result = await repository.getMovieImage(movieId: movieId);
    setLoading(false);
    if (result is MovieImage) {
      _movieDetail!.movieImage = result;
      update();
    } else {
      log('===================> error: $result');
    }
  }

  Future<void> getMovieTrailerId() async {
    setLoading(true);
    final result = await repository.getTrailerId(movieId: movieId);
    setLoading(false);
    if (result is TrailerResponse) {
      if (result.trailers!.isNotEmpty) {
        _movieDetail!.trailerId = result.trailers![0].key;
      }
      update();
    } else {
      log('===================> error: $result');
    }
  }

  Future<void> getMovieCastList() async {
    setLoading(true);
    final result = await repository.getCastList(movieId: movieId);
    setLoading(false);
    if (result is CastResponse) {
      _movieDetail!.castList = result.casts;
      update();
    } else {
      log('===================> error: $result');
    }
  }

  MovieDetail? get movieDetail => _movieDetail;
}
