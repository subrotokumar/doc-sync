// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../login_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) {
  return _LoginUserResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginUserResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginUserResponseCopyWith<LoginUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserResponseCopyWith<$Res> {
  factory $LoginUserResponseCopyWith(
          LoginUserResponse value, $Res Function(LoginUserResponse) then) =
      _$LoginUserResponseCopyWithImpl<$Res, LoginUserResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String username,
      String email,
      String avatar,
      String accessToken,
      String refreshToken});
}

/// @nodoc
class _$LoginUserResponseCopyWithImpl<$Res, $Val extends LoginUserResponse>
    implements $LoginUserResponseCopyWith<$Res> {
  _$LoginUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? avatar = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginUserResponseImplCopyWith<$Res>
    implements $LoginUserResponseCopyWith<$Res> {
  factory _$$LoginUserResponseImplCopyWith(_$LoginUserResponseImpl value,
          $Res Function(_$LoginUserResponseImpl) then) =
      __$$LoginUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String username,
      String email,
      String avatar,
      String accessToken,
      String refreshToken});
}

/// @nodoc
class __$$LoginUserResponseImplCopyWithImpl<$Res>
    extends _$LoginUserResponseCopyWithImpl<$Res, _$LoginUserResponseImpl>
    implements _$$LoginUserResponseImplCopyWith<$Res> {
  __$$LoginUserResponseImplCopyWithImpl(_$LoginUserResponseImpl _value,
      $Res Function(_$LoginUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? avatar = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$LoginUserResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginUserResponseImpl implements _LoginUserResponse {
  _$LoginUserResponseImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.username,
      required this.email,
      required this.avatar,
      required this.accessToken,
      required this.refreshToken});

  factory _$LoginUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginUserResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String avatar;
  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'LoginUserResponse(id: $id, username: $username, email: $email, avatar: $avatar, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, username, email, avatar, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserResponseImplCopyWith<_$LoginUserResponseImpl> get copyWith =>
      __$$LoginUserResponseImplCopyWithImpl<_$LoginUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginUserResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginUserResponse implements LoginUserResponse {
  factory _LoginUserResponse(
      {@JsonKey(name: '_id') required final String id,
      required final String username,
      required final String email,
      required final String avatar,
      required final String accessToken,
      required final String refreshToken}) = _$LoginUserResponseImpl;

  factory _LoginUserResponse.fromJson(Map<String, dynamic> json) =
      _$LoginUserResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String get avatar;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$LoginUserResponseImplCopyWith<_$LoginUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
