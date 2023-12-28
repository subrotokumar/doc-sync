// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:docsync/src/features/home/domain/entities/document.dart';

part 'generated/document_model.freezed.dart';
part 'generated/document_model.g.dart';

@freezed
class DocumentModel extends Document with _$DocumentModel {
  factory DocumentModel({
    @JsonKey(name: '_id') required String id,
    required String title,
    required List<String>? content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
}

@freezed
class MyDocumentModel extends MyDocuments with _$MyDocumentModel {
  factory MyDocumentModel({
    required List<DocumentModel> docs,
  }) = _MyDocumentModel;

  factory MyDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$MyDocumentModelFromJson(json);
}
