import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kino_app/core/constants/constants.dart';
import 'package:kino_app/data/network/token_interceptor.dart';

class HttpService {
  late Dio dio;

  HttpService() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );
    dio.interceptors.add(TokenInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }
}
