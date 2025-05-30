import 'package:dio/dio.dart';

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = '';

  ServerError.withError({required Object error}) {
    _handleError(error as DioException);
  }

  _handleError(DioException error) {
    _errorCode = error.response?.statusCode ?? 500;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.badResponse:
        {
          if (error.response?.data['Error'] is Map<String, dynamic>) {
            _errorMessage = error.response!.data['Error']['Message'].toString();
          } else {
            _errorMessage = error.response!.data['Message'].toString();
          }
          break;
        }
      case DioExceptionType.cancel:
        _errorMessage = "Canceled";
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Something wrong";
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
    return _errorMessage;
  }

  int? getErrorCode() => _errorCode;

  String getErrorMessage() => _errorMessage;
}
