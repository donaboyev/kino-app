import '../remote/remote_source.dart';

class PopularMoreRepository {
  final RemoteSource remoteSource;

  const PopularMoreRepository({required this.remoteSource});

  Future<dynamic> getPopularMovies({required int page}) async {
    final response = await remoteSource.getPopularMovies(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
