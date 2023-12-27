// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthUserReq {
  final String username;
  final String password;
  final String email;
  AuthUserReq({
    required this.username,
    required this.password,
    required this.email,
  });

  @override
  bool operator ==(covariant AuthUserReq other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.email == email;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ email.hashCode;
}
