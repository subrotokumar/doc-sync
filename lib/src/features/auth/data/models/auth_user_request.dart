import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/auth_user_request.g.dart';
part 'generated/auth_user_request.freezed.dart';

@freezed
class AuthUserRequest extends AuthUserReq with _$AuthUserRequest {
  factory AuthUserRequest({
    String? username,
    required String password,
    String? email,
  }) = _AuthUserRequest;

  factory AuthUserRequest.fromJson(Map<String, String> json) =>
      _$AuthUserRequestFromJson(json);
}
