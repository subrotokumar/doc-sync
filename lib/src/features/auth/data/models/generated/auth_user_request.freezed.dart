// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../auth_user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUserRequest _$AuthUserRequestFromJson(Map<String, dynamic> json) {
  return _AuthUserRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthUserRequest {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserRequestCopyWith<AuthUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserRequestCopyWith<$Res> {
  factory $AuthUserRequestCopyWith(
          AuthUserRequest value, $Res Function(AuthUserRequest) then) =
      _$AuthUserRequestCopyWithImpl<$Res, AuthUserRequest>;
  @useResult
  $Res call({String username, String password, String email});
}

/// @nodoc
class _$AuthUserRequestCopyWithImpl<$Res, $Val extends AuthUserRequest>
    implements $AuthUserRequestCopyWith<$Res> {
  _$AuthUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserRequestImplCopyWith<$Res>
    implements $AuthUserRequestCopyWith<$Res> {
  factory _$$AuthUserRequestImplCopyWith(_$AuthUserRequestImpl value,
          $Res Function(_$AuthUserRequestImpl) then) =
      __$$AuthUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String email});
}

/// @nodoc
class __$$AuthUserRequestImplCopyWithImpl<$Res>
    extends _$AuthUserRequestCopyWithImpl<$Res, _$AuthUserRequestImpl>
    implements _$$AuthUserRequestImplCopyWith<$Res> {
  __$$AuthUserRequestImplCopyWithImpl(
      _$AuthUserRequestImpl _value, $Res Function(_$AuthUserRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? email = null,
  }) {
    return _then(_$AuthUserRequestImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUserRequestImpl implements _AuthUserRequest {
  _$AuthUserRequestImpl(
      {required this.username, required this.password, required this.email});

  factory _$AuthUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUserRequestImplFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthUserRequest(username: $username, password: $password, email: $email)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserRequestImplCopyWith<_$AuthUserRequestImpl> get copyWith =>
      __$$AuthUserRequestImplCopyWithImpl<_$AuthUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUserRequestImplToJson(
      this,
    );
  }
}

abstract class _AuthUserRequest implements AuthUserRequest {
  factory _AuthUserRequest(
      {required final String username,
      required final String password,
      required final String email}) = _$AuthUserRequestImpl;

  factory _AuthUserRequest.fromJson(Map<String, dynamic> json) =
      _$AuthUserRequestImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$AuthUserRequestImplCopyWith<_$AuthUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
