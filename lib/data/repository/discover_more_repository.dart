import 'package:get/get.dart';

import '../network/http_service.dart';
import '../remote/remote_source.dart';

class DiscoverMoreRepository {
  final RemoteSource remoteSource;

  const DiscoverMoreRepository({required this.remoteSource});

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
    final response = await Get.find<HttpService>().dio.get('/genre/movie/list');
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
