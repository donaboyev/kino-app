import 'package:kino_app/data/network/api_client.dart';
import 'package:kino_app/data/remote/response_handler.dart';
import 'package:kino_app/data/remote/server_error.dart';
import 'package:kino_app/data/response/cast_response.dart';
import 'package:kino_app/data/response/genre_response.dart';
import 'package:kino_app/data/response/movie_detail.dart';
import 'package:kino_app/data/response/movie_image.dart';
import 'package:kino_app/data/response/movie_response.dart';
import 'package:kino_app/data/response/person_detail.dart';
import 'package:kino_app/data/response/person_response.dart';
import 'package:kino_app/data/response/trailer_response.dart';

class RemoteSource {
  ApiClient apiClient;

  RemoteSource({required this.apiClient});

  Future<ResponseHandler<MovieResponse>> getUpcomingMovies() async {
    MovieResponse response;
    try {
      response = await apiClient.getUpcomingMovies();
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<MovieResponse>> getNowPlayingMovies({
    required int page,
  }) async {
    MovieResponse response;
    try {
      response = await apiClient.getNowPlayingMovies(page);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<MovieResponse>> getTopRatedMovies({
    required int page,
  }) async {
    MovieResponse response;
    try {
      response = await apiClient.getTopRatedMovies(page);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<MovieResponse>> getPopularMovies({
    required int page,
  }) async {
    MovieResponse response;
    try {
      response = await apiClient.getPopularMovies(page);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<MovieResponse>> getMoviesByGenre({
    required int? genreId,
    required int page,
  }) async {
    MovieResponse response;
    try {
      response = await apiClient.getMoviesByGenre(genreId, page);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<GenreResponse>> getGenres() async {
    GenreResponse response;
    try {
      response = await apiClient.getGenres();
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<PersonResponse>> getTrendingPersons({
    required int page,
  }) async {
    PersonResponse response;
    try {
      response = await apiClient.getTrendingPeople(page);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<MovieDetail>> getMovieDetail({
    required int? movieId,
  }) async {
    MovieDetail movieDetail;
    try {
      movieDetail = await apiClient.getMovieDetail(movieId);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = movieDetail;
  }

  Future<ResponseHandler<TrailerResponse>> getTrailerId({
    required int? movieId,
  }) async {
    TrailerResponse response;
    try {
      response = await apiClient.getTrailerId(movieId);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<MovieImage>> getMovieImage({
    required int? movieId,
  }) async {
    MovieImage movieImage;
    try {
      movieImage = await apiClient.getMovieImage(movieId);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = movieImage;
  }

  Future<ResponseHandler<CastResponse>> getCastList({
    required int? movieId,
  }) async {
    CastResponse casts;
    try {
      casts = await apiClient.getCastList(movieId);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = casts;
  }

  Future<ResponseHandler<PersonDetail>> getPersonDetail({
    required int? personId,
  }) async {
    PersonDetail response;
    try {
      response = await apiClient.getPersonDetail(personId);
    } catch (error, stacktrace) {
      print(
        'Exceptions occurred getNowPlayingMovies: $error stacktrace: $stacktrace',
      );
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }
}
