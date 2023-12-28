// ignore_for_file: invalid_annotation_target

import 'package:docsync/src/features/common/domain/entities/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_data_model.g.dart';
part 'generated/user_data_model.freezed.dart';

@freezed
class UserDataModel extends UserData with _$UserDataModel {
  factory UserDataModel({
    @JsonKey(name: '_id') required String id,
    required String username,
    required String email,
    required String avatar,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}
