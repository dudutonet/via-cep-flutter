import 'dart:io';

import 'package:dio/dio.dart';

import '../interceptors/failure_interceptor.dart';
import '../rest_client.dart';
import '../rest_client_response.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final String? baseUrl;

  BaseOptions _defaultOptions() => BaseOptions(
        // TODO - Alterar essa base URL...
        baseUrl: 'http://10.3.16.191:5001',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        },
      );

  DioRestClient({BaseOptions? baseOptions, this.baseUrl}) {
    _dio = Dio(baseOptions ?? _defaultOptions());

    _dio.interceptors.addAll([
      FailureInterceptor(),
    ]);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> path<T>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String url, {
    required String method,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<RestClientResponse<T>> download<T>(
    String urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    data,
    ResponseType? responseType,
    bool? followRedirects,
    Duration? receiveTimeout,
  }) async {
    try {
      final response = await _dio.download(
        urlPath,
        savePath,
        cancelToken: cancelToken,
        data: data,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          responseType: responseType,
          followRedirects: followRedirects,
          receiveTimeout: receiveTimeout,
        ),
      );

      return _dioResponseConverter(response);
    } on DioError {
      rethrow;
    }
  }
}
