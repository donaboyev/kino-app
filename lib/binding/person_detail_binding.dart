import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../controller/controllers.dart';
import '../data/repository/repositories.dart';

class PersonDetailBinding implements Bindings {
  @override
  void dependencies() async {
    var personDetailRepository = PersonDetailRepository(
      remoteSource: RemoteSource(),
    );
    Get.lazyPut<PersonDetailController>(
      () => PersonDetailController(repository: personDetailRepository),
    );
  }
}
