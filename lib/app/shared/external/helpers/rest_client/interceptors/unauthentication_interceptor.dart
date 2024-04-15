import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../utils/default_failure_messages/default_failure_messages.dart';

class UnauthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Base URL: ${options.baseUrl}');
    debugPrint('URI: ${options.path}');
    debugPrint('Data: ${options.data}');
    debugPrint('Content Type: ${options.contentType}');
    debugPrint('Headers: ${options.headers}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error Message: ${err.message}');
    debugPrint('Error Status Code: ${err.response?.statusCode}');
    debugPrint('Error: ${err.error}');
    debugPrint('Error RuntimeType: ${err.error.runtimeType}');
    debugPrint('Error Type: ${err.type}');

    if (err.type == DioExceptionType.connectionTimeout) {
      handler.reject(
        err.copyWith(
          message: DefaultFailureMessages.timeoutMessage,
        ),
      );
    } else if (err.error.runtimeType == SocketException) {
      handler.reject(
        err.copyWith(
          message:
              '${(err.error as SocketException).message} | ${(err.error as SocketException).address?.address ?? '000.000.000.000'}',
        ),
      );
    } else {
      handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Headers: ${response.headers}');
    debugPrint('Response Data: ${response.data}');
    handler.next(response);
  }
}
