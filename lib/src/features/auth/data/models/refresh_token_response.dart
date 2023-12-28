import 'package:docsync/src/features/auth/domain/entities/refresh_token_res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/refresh_token_response.freezed.dart';
part 'generated/refresh_token_response.g.dart';

@freezed
class RefreshTokenResponse extends RefreshTokenRes with _$RefreshTokenResponse {
  factory RefreshTokenResponse({
    required String refreshToken,
    required String accessToken,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}
