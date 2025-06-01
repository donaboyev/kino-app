import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../controller/controllers.dart';
import '../data/repository/repositories.dart';

class TopRatedMoreBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = TopRatedMoreRepository(remoteSource: RemoteSource());
    Get.lazyPut<TopRatedMoreController>(
      () => TopRatedMoreController(repository: moreRepository),
    );
  }
}
