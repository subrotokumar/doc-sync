import 'dart:io';

import 'package:dio/dio.dart';
import 'package:docsync/src/core/constants/env.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:docsync/src/config/config.dart';
import 'package:docsync/src/config/logger/dio_logger.dart';
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/utils/secure_storage.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_req.dart';
import 'package:docsync/src/features/auth/presentation/provider/user_provider.dart';

part 'generated/provider.g.dart';

@Riverpod(keepAlive: true)
class AccessToken extends _$AccessToken {
  @override
  String build() => '';

  set update(String val) => state = val;
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref,
    {bool useIsolate = false, bool useRefreshInterceptor = true}) {
  final dio = Dio()
    ..options.baseUrl = '${Env.endpoint}/api/v1'
    ..options.contentType = 'application/json'
    ..options.connectTimeout = 5.seconds
    ..options.receiveTimeout = 3.seconds
    ..interceptors.addAll([
      if (kDebugMode)
        DioLogging(
          responseBody: true,
          requestBody: true,
        ),
      if (useRefreshInterceptor)
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final access = ref.read(accessTokenProvider);
            if (access.isEmpty) return handler.next(options);
            options.headers['Authorization'] = 'Bearer $access';
            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            final refreshToken = await SecureStorage.getRefreshToken;
            if (refreshToken == null || refreshToken == '') {
              handler.reject(e);
            } else if (e.response?.statusCode == HttpStatus.unauthorized) {
              final res = await ref
                  .read(refreshTokenUseCaseProvider)
                  .call(RefreshTokenReq(refresh: refreshToken));
              if (res is DataSuccess &&
                  res.data?.statusCode == HttpStatus.accepted) {
                await SecureStorage.setRefreshToken(
                    res.data?.data?.refreshToken ?? '');
                ref.read(accessTokenProvider.notifier).update =
                    res.data?.data?.accessToken ?? '';
                e.requestOptions.headers['Authorization'] =
                    'Bearer ${res.data?.data?.accessToken}';
              } else {
                ref.read(accessTokenProvider.notifier).update = '';
                await SecureStorage.setRefreshToken('');
                handler.reject(e);
              }
            }
          },
        ),
    ]);
  if (useIsolate) {
    dio.transformer = (BackgroundTransformer()..jsonDecodeCallback = parseJson);
  }
  return dio;
}
