import 'package:get/get.dart';
import 'package:kino_app/controller/home_controller.dart';
import 'package:kino_app/data/network/http_service.dart';
import 'package:kino_app/data/remote/remote_source.dart';
import 'package:kino_app/data/network/api_client.dart';
import 'package:kino_app/data/repository/home_repository.dart';

class HttpServiceBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<HttpService>(
      () async => HttpService(),
    );
  }
}
