import 'package:get/get.dart';
import 'package:kino_app/data/remote/remote_source.dart';

import '../controller/controllers.dart';
import '../data/repository/repositories.dart';

class NowPlayingMoreBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = NowPlayingMoreRepository(
      remoteSource: RemoteSource(),
    );
    Get.lazyPut<NowPlayingMoreController>(
      () => NowPlayingMoreController(repository: moreRepository),
    );
  }
}
