// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUserRequestImpl _$$AuthUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthUserRequestImpl(
      username: json['username'] as String?,
      password: json['password'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$AuthUserRequestImplToJson(
        _$AuthUserRequestImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
    };
