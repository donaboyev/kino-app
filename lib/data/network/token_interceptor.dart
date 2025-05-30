import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"Authorization": "Bearer ${Constants.apiKey}"});
    handler.next(options);
  }
}
