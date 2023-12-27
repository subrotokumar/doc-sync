import 'dart:io';

import 'package:dio/dio.dart';
import 'package:docsync/src/config/logger/dio_logger.dart';
import 'package:docsync/src/core/utils/extension.dart';
import 'package:docsync/src/core/utils/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generated/provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref, {bool useIsolate = false}) {
  final dio = Dio()
    ..options.baseUrl = 'https://localhost:3001/api/v1'
    ..options.contentType = 'application/json'
    ..options.connectTimeout = 5.seconds
    ..options.receiveTimeout = 3.seconds
    ..interceptors.addAll([
      if (kDebugMode)
        DioLogging(
          responseBody: true,
          requestBody: true,
        ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == HttpStatus.unauthorized) {}
          return handler.next(e);
        },
      ),
    ]);
  if (useIsolate) {
    dio.transformer = (BackgroundTransformer()..jsonDecodeCallback = parseJson);
  }
  return dio;
}
