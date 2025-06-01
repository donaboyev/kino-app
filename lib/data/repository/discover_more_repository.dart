import 'package:get/get.dart';

import '../network/http_service.dart';

class DiscoverMoreRepository {
  const DiscoverMoreRepository();

  Future<dynamic> getMoviesByGenre({
    required int? genreId,
    required int page,
  }) async {
    final response = await Get.find<HttpService>().dio.get(
      '/discover/movie/',
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
}
