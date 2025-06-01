import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../network/http_service.dart';

class HomeRepository {
  final RemoteSource remoteSource;

  const HomeRepository({required this.remoteSource});

  Future<dynamic> getUpcomingMovies() async {
    final response = await remoteSource.getUpcomingMovies();
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getNowPlayingMovies({required int page}) async {
    final response = await remoteSource.getNowPlayingMovies(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getPopularMovies({required int page}) async {
    final response = await remoteSource.getPopularMovies(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getTopRatedMovies({required int page}) async {
    final response = await remoteSource.getTopRatedMovies(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getMoviesByGenre({
    required int? genreId,
    required int page,
  }) async {
    final response = await remoteSource.getMoviesByGenre(
      genreId: genreId,
      page: page,
    );
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getGenres() async {
    final response = await remoteSource.getGenres();
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getTrendingPeople({required int page}) async {
    final response = await remoteSource.getTrendingPersons(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
