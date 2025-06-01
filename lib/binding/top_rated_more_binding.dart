import 'package:get/get.dart';
import 'package:kino_app/controller/top_rated_more_controller.dart';
import 'package:kino_app/data/remote/remote_source.dart';
import 'package:kino_app/data/repository/top_rated_more_repository.dart';

class TopRatedMoreBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = TopRatedMoreRepository(remoteSource: RemoteSource());
    Get.lazyPut<TopRatedMoreController>(
      () => TopRatedMoreController(repository: moreRepository),
    );
  }
}
