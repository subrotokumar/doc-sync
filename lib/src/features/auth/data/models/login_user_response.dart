// ignore_for_file: invalid_annotation_target

import 'package:docsync/src/features/auth/domain/entities/login_user_res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/login_user_response.g.dart';
part 'generated/login_user_response.freezed.dart';

@freezed
class LoginUserResponse extends LoginUserRes with _$LoginUserResponse {
  factory LoginUserResponse({
    @JsonKey(name: '_id') required String id,
    required String username,
    required String email,
    required String avatar,
    required String accessToken,
    required String refreshToken,
  }) = _LoginUserResponse;

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);
}
