import 'package:dio/dio.dart';

import '../../errors/failure.dart';

class FailureInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(Failure.fromDioError(err));
  }
}
