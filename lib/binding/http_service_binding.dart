import 'package:get/get.dart';
import 'package:kino_app/data/network/http_service.dart';

class HttpServiceBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<HttpService>(
      () async => HttpService(),
    );
  }
}
