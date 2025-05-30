import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kino_app/core/constants/constants.dart';
import 'package:kino_app/data/network/token_interceptor.dart';
import 'package:kino_app/data/response/cast_response.dart';
import 'package:kino_app/data/response/genre_response.dart';
import 'package:kino_app/data/response/movie_detail.dart';
import 'package:kino_app/data/response/movie_image.dart';
import 'package:kino_app/data/response/movie_response.dart';
import 'package:kino_app/data/response/person_detail.dart';
import 'package:kino_app/data/response/person_response.dart';
import 'package:kino_app/data/response/trailer_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));
    if (kDebugMode) dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.addAll([
      LogInterceptor(responseBody: true, requestBody: true),
      TokenInterceptor(),
    ]);
    return dio;
  }

  static ApiClient? _apiClient;

  static ApiClient? getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient;
    } else {
      _apiClient = ApiClient(getDio, baseUrl);
      return _apiClient;
    }
  }

  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(
      receiveTimeout: Duration(seconds: 30),
      connectTimeout: Duration(seconds: 30),
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('movie/upcoming')
  Future<MovieResponse> getUpcomingMovies();

  @GET('movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies(@Query('page') int page);

  @GET('movie/popular')
  Future<MovieResponse> getPopularMovies(@Query('page') int page);

  @GET('movie/top_rated')
  Future<MovieResponse> getTopRatedMovies(@Query('page') int page);

  @GET('discover/movie')
  Future<MovieResponse> getMoviesByGenre(
    @Query('with_genres') int? genreId,
    @Query('page') int page,
  );

  @GET('genre/movie/list')
  Future<GenreResponse> getGenres();

  @GET('person/popular')
  Future<PersonResponse> getTrendingPeople(@Query('page') int page);

  @GET('movie/{movieId}')
  Future<MovieDetail> getMovieDetail(@Path('movieId') int? movieId);

  @GET('movie/{movieId}/videos')
  Future<TrailerResponse> getTrailerId(@Path('movieId') int? movieId);

  @GET('movie/{movieId}/images')
  Future<MovieImage> getMovieImage(@Path('movieId') int? movieId);

  @GET('movie/{movieId}/credits')
  Future<CastResponse> getCastList(@Path('movieId') int? movieId);

  @GET('person/{personId}')
  Future<PersonDetail> getPersonDetail(@Path('personId') int? personId);
}
