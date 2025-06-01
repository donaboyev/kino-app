import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../network/http_service.dart';
import '../response/responses.dart';
import 'response_handler.dart';
import 'server_error.dart';

class RemoteSource {
  RemoteSource();

  Future<ResponseHandler<MovieResponse>> getUpcomingMovies() async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/movie/upcoming');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieResponse.fromJson(response.data);
  }

  Future<ResponseHandler<MovieResponse>> getNowPlayingMovies({
    required int page,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get(
        '/movie/now_playing',
        queryParameters: {'page': page},
      );
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieResponse.fromJson(response.data);
  }

  Future<ResponseHandler<MovieResponse>> getTopRatedMovies({
    required int page,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get(
        '/movie/top_rated',
        queryParameters: {'page': page},
      );
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieResponse.fromJson(response.data);
  }

  Future<ResponseHandler<MovieResponse>> getPopularMovies({
    required int page,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get(
        '/movie/popular',
        queryParameters: {'page': page},
      );
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieResponse.fromJson(response.data);
  }

  Future<ResponseHandler<MovieResponse>> getMoviesByGenre({
    required int? genreId,
    required int page,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get(
        '/discover/movie',
        queryParameters: {'page': page, 'with_genres': genreId},
      );
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieResponse.fromJson(response.data);
  }

  Future<ResponseHandler<GenreResponse>> getGenres() async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/genre/movie/list');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = GenreResponse.fromJson(response.data);
  }

  Future<ResponseHandler<PersonResponse>> getTrendingPersons({
    required int page,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get(
        '/person/popular',
        queryParameters: {'page': page},
      );
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = PersonResponse.fromJson(response.data);
  }

  Future<ResponseHandler<MovieDetail>> getMovieDetail({
    required int? movieId,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/movie/$movieId');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieDetail.fromJson(response.data);
  }

  Future<ResponseHandler<TrailerResponse>> getTrailerId({
    required int? movieId,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/movie/$movieId/videos');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = TrailerResponse.fromJson(response.data);
  }

  Future<ResponseHandler<MovieImage>> getMovieImage({
    required int? movieId,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/movie/$movieId/images');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = MovieImage.fromJson(response.data);
  }

  Future<ResponseHandler<CastResponse>> getCastList({
    required int? movieId,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/movie/$movieId/credits');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = CastResponse.fromJson(response.data);
  }

  Future<ResponseHandler<PersonDetail>> getPersonDetail({
    required int? personId,
  }) async {
    dio.Response response;
    try {
      response = await Get.find<HttpService>().dio.get('/person/$personId');
    } catch (error, stacktrace) {
      debugPrint(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = PersonDetail.fromJson(response.data);
  }
}
