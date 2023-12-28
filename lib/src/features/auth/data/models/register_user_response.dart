// ignore_for_file: invalid_annotation_target

import 'package:docsync/src/features/auth/domain/entities/register_user_res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/register_user_response.g.dart';
part 'generated/register_user_response.freezed.dart';

@freezed
class RegisterUserResponse extends RegisterUserRes with _$RegisterUserResponse {
  factory RegisterUserResponse({
    @JsonKey(name: '_id') required String id,
    required String username,
    required String email,
    required String avatar,
  }) = _RegisterUserResponse;

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);
}
