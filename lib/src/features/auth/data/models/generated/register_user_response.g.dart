// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../register_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterUserResponseImpl _$$RegisterUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterUserResponseImpl(
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$$RegisterUserResponseImplToJson(
        _$RegisterUserResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
    };
