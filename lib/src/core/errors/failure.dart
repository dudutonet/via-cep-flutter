import 'dart:convert';

import 'package:dio/dio.dart';

abstract class Failure extends DioError {
  final String key;
  final int code;
  final Object? list;
  @override
  // ignore: overridden_fields
  final String message;
  Failure({
    this.message = "",
    this.key = "",
    DioError? dioError,
    int? code,
    this.list,
  })  : code = code ?? 0,
        super(
          requestOptions: dioError?.requestOptions ?? RequestOptions(path: ''),
          response: dioError?.response,
          type: dioError?.type ?? DioErrorType.unknown,
          error: dioError?.error,
        );

  static Failure fromDioError(DioError dioError) {
    Map<String, dynamic>? data;

    String? message;

    if (dioError.response?.data is Map && dioError.response?.data["description"] != null) {
      message = dioError.response?.data["description"];
    } else {
      try {
        data = jsonDecode(dioError.response?.data);
      } catch (_) {
        message = dioError.response?.data;
      }
    }

    if (data != null && data.containsKey('message')) {
      message = data['message'];
    } else if (message == null && dioError.message != null && dioError.message!.isNotEmpty) {
      message = dioError.message;
    } else if (message == null && dioError.response?.statusMessage?.isNotEmpty == true) {
      message = dioError.response!.statusMessage;
    }

    return parse(
      statusCode: dioError.response?.statusCode ?? 0,
      message: message,
    );
  }

  static Failure parse({
    required int statusCode,
    String? message,
  }) {
    switch (statusCode) {
      case 404:
        return NotFoundFailure(message: message, code: statusCode);
      case 500:
      case 503:
        return ServerFailure(message: message, code: statusCode);
      default:
        return UnhandledFailure(message: message, code: statusCode);
    }
  }
}

class ServerFailure extends Failure {
  ServerFailure({String? message, int? code})
      : super(message: message ?? "Ocorreu um erro no servidor.", code: code);
}

class UnhandledFailure extends Failure {
  UnhandledFailure({String? message, int? code, Object? list})
      : super(message: message ?? "Ocorreu um erro, verifique.", code: code, list: list);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({String? message, int? code})
      : super(
          message: message ?? "Dados não encontrado.",
          code: code,
        );
}
