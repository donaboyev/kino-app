import 'package:kino_app/data/remote/remote_source.dart';

class MovieDetailRepository {
  final RemoteSource? remoteSource;

  const MovieDetailRepository({this.remoteSource});

  Future<dynamic> getMovieDetail({int? movieId}) async {
    final response = await remoteSource!.getMovieDetail(movieId: movieId);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getTrailerId({int? movieId}) async {
    final response = await remoteSource!.getTrailerId(movieId: movieId);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getMovieImage({int? movieId}) async {
    final response = await remoteSource!.getMovieImage(movieId: movieId);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }

  Future<dynamic> getCastList({int? movieId}) async {
    final response = await remoteSource!.getCastList(movieId: movieId);
    if (response.data != null) {
      return response.data;
    }
    return 'Error occurred';
  }
}
