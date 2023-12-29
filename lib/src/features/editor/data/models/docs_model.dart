// ignore_for_file: invalid_annotation_target

import 'package:docsync/src/features/editor/domain/entities/docs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/docs_model.freezed.dart';
part 'generated/docs_model.g.dart';

@freezed
class DocsModel extends Docs with _$DocsModel {
  factory DocsModel({
    required String createdBy,
    @JsonKey(name: '_id') required String id,
    required String title,
    required List<String> content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DocsModel;

  factory DocsModel.fromJson(Map<String, dynamic> json) =>
      _$DocsModelFromJson(json);
}

@freezed
class UpdateDocsTitleReqModel extends UpdateDocsTitleReq
    with _$UpdateDocsTitleReqModel {
  factory UpdateDocsTitleReqModel({
    required String id,
    required String title,
  }) = _UpdateDocsTitleReqModel;

  factory UpdateDocsTitleReqModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateDocsTitleReqModelFromJson(json);
}
