// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../docs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocsModelImpl _$$DocsModelImplFromJson(Map<String, dynamic> json) =>
    _$DocsModelImpl(
      createdBy: json['createdBy'] as String,
      id: json['_id'] as String,
      title: json['title'] as String,
      content: json['content'] as List<dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DocsModelImplToJson(_$DocsModelImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$UpdateDocsTitleReqModelImpl _$$UpdateDocsTitleReqModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateDocsTitleReqModelImpl(
      id: json['documentId'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$UpdateDocsTitleReqModelImplToJson(
        _$UpdateDocsTitleReqModelImpl instance) =>
    <String, dynamic>{
      'documentId': instance.id,
      'title': instance.title,
    };
