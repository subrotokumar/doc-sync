// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../login_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginUserResponseImpl _$$LoginUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginUserResponseImpl(
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$LoginUserResponseImplToJson(
        _$LoginUserResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
