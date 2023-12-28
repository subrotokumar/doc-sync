import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/api_response.g.dart';
part 'generated/api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required int statusCode,
    required String message,
    required bool success,
    T? data,
  }) = ApiResponseData;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
