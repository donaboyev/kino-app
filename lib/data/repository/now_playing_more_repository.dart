import 'package:kino_app/data/remote/remote_source.dart';

class NowPlayingMoreRepository {
  final RemoteSource remoteSource;

  const NowPlayingMoreRepository({required this.remoteSource});

  Future<dynamic> getNowPlayingMovies({required int page}) async {
    final response = await remoteSource.getNowPlayingMovies(page: page);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
