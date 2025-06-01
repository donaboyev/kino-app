import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../controller/controllers.dart';
import '../data/repository/repositories.dart';

class PopularMoreBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = PopularMoreRepository(remoteSource: RemoteSource());
    Get.lazyPut<PopularMoreController>(
      () => PopularMoreController(repository: moreRepository),
    );
  }
}
