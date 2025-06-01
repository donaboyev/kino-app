import 'package:get/get.dart';

import '../controller/controllers.dart';
import '../data/remote/remote_source.dart';
import '../data/repository/repositories.dart';

class DiscoverMoreBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = DiscoverMoreRepository(remoteSource: RemoteSource());
    Get.lazyPut<DiscoverMoreController>(
      () => DiscoverMoreController(repository: moreRepository),
    );
  }
}
