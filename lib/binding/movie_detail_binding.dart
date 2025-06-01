import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../controller/controllers.dart';
import '../data/repository/repositories.dart';

class MovieDetailBinding implements Bindings {
  @override
  void dependencies() async {
    var movieDetailRepository = MovieDetailRepository(
      remoteSource: RemoteSource(),
    );
    Get.lazyPut<MovieDetailController>(
      () => MovieDetailController(repository: movieDetailRepository),
    );
  }
}
