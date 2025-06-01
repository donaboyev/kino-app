import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../controller/controllers.dart';
import '../data/repository/repositories.dart';

class PeopleMoreBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = PeopleMoreRepository(remoteSource: RemoteSource());
    Get.lazyPut<PeopleMoreController>(
      () => PeopleMoreController(repository: moreRepository),
    );
  }
}
