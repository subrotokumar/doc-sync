// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginUserRes {
  final String id;
  final String username;
  final String email;
  final String avatar;
  final String accessToken;
  final String refreshToken;
  LoginUserRes({
    required this.id,
    required this.username,
    required this.email,
    required this.avatar,
    required this.accessToken,
    required this.refreshToken,
  });
}
