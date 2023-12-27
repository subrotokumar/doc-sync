import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:docsync/src/features/auth/domain/entities/refresh_token_req.dart';

part 'generated/refresh_token_request.freezed.dart';
part 'generated/refresh_token_request.g.dart';

@freezed
class RefreshTokenRequest extends RefreshTokenReq with _$RefreshTokenRequest {
  factory RefreshTokenRequest({required String refresh}) = _RefreshTokenRequest;
  factory RefreshTokenRequest.fromJson(Map<String, String> json) =>
      _$RefreshTokenRequestFromJson(json);
}
