import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:docsync/src/core/resource/data_state.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

mixin BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
