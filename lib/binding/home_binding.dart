import 'package:get/get.dart';

import '../controller/controllers.dart';
import '../data/remote/remote_source.dart';
import '../data/repository/repositories.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<HomeController>(
      () async => HomeController(
        repository: HomeRepository(remoteSource: RemoteSource()),
      ),
    );
  }
}
