// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      content:
          (json['content'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$MyDocumentModelImpl _$$MyDocumentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyDocumentModelImpl(
      docs: (json['docs'] as List<dynamic>)
          .map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyDocumentModelImplToJson(
        _$MyDocumentModelImpl instance) =>
    <String, dynamic>{
      'docs': instance.docs,
    };
