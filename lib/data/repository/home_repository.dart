import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../network/http_service.dart';

class HomeRepository {
  const HomeRepository();

  Future<dynamic> getUpcomingMovies() async {
    final response = await Get.find<HttpService>().dio.get('/movie/upcoming');
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getNowPlayingMovies({required int page}) async {
    final response = await Get.find<HttpService>().dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getPopularMovies({required int page}) async {
    final response = await Get.find<HttpService>().dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getTopRatedMovies({required int page}) async {
    final response = await Get.find<HttpService>().dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getMoviesByGenre({
    required int? genreId,

    required int page,
  }) async {
    final response = await Get.find<HttpService>().dio.get(
      '/discover/movie',
      queryParameters: {'with_genres': genreId, 'page': page},
    );
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getGenres() async {
    final response = await Get.find<HttpService>().dio.get('/genre/movie/list');
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getTrendingPeople({required int page}) async {
    final response = await Get.find<HttpService>().dio.get('/person/popular');
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
