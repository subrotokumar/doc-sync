// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String username;
  final String email;
  final String refresh;
  final String avatar;
  User({
    required this.username,
    required this.email,
    required this.refresh,
    required this.avatar,
  });

  User copyWith({
    String? username,
    String? email,
    String? refresh,
    String? avatar,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      refresh: refresh ?? this.refresh,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'refresh': refresh,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      email: map['email'] as String,
      refresh: map['refresh'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(username: $username, email: $email, refresh: $refresh, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.refresh == refresh &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        refresh.hashCode ^
        avatar.hashCode;
  }
}
