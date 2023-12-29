// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../docs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DocsModel _$DocsModelFromJson(Map<String, dynamic> json) {
  return _DocsModel.fromJson(json);
}

/// @nodoc
mixin _$DocsModel {
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocsModelCopyWith<DocsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocsModelCopyWith<$Res> {
  factory $DocsModelCopyWith(DocsModel value, $Res Function(DocsModel) then) =
      _$DocsModelCopyWithImpl<$Res, DocsModel>;
  @useResult
  $Res call(
      {String createdBy,
      @JsonKey(name: '_id') String id,
      String title,
      List<String> content,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DocsModelCopyWithImpl<$Res, $Val extends DocsModel>
    implements $DocsModelCopyWith<$Res> {
  _$DocsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocsModelImplCopyWith<$Res>
    implements $DocsModelCopyWith<$Res> {
  factory _$$DocsModelImplCopyWith(
          _$DocsModelImpl value, $Res Function(_$DocsModelImpl) then) =
      __$$DocsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdBy,
      @JsonKey(name: '_id') String id,
      String title,
      List<String> content,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DocsModelImplCopyWithImpl<$Res>
    extends _$DocsModelCopyWithImpl<$Res, _$DocsModelImpl>
    implements _$$DocsModelImplCopyWith<$Res> {
  __$$DocsModelImplCopyWithImpl(
      _$DocsModelImpl _value, $Res Function(_$DocsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = null,
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DocsModelImpl(
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocsModelImpl implements _DocsModel {
  _$DocsModelImpl(
      {required this.createdBy,
      @JsonKey(name: '_id') required this.id,
      required this.title,
      required final List<String> content,
      required this.createdAt,
      required this.updatedAt})
      : _content = content;

  factory _$DocsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocsModelImplFromJson(json);

  @override
  final String createdBy;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  final List<String> _content;
  @override
  List<String> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DocsModel(createdBy: $createdBy, id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocsModelImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdBy, id, title,
      const DeepCollectionEquality().hash(_content), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocsModelImplCopyWith<_$DocsModelImpl> get copyWith =>
      __$$DocsModelImplCopyWithImpl<_$DocsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocsModelImplToJson(
      this,
    );
  }
}

abstract class _DocsModel implements DocsModel {
  factory _DocsModel(
      {required final String createdBy,
      @JsonKey(name: '_id') required final String id,
      required final String title,
      required final List<String> content,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DocsModelImpl;

  factory _DocsModel.fromJson(Map<String, dynamic> json) =
      _$DocsModelImpl.fromJson;

  @override
  String get createdBy;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  List<String> get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DocsModelImplCopyWith<_$DocsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateDocsTitleReqModel _$UpdateDocsTitleReqModelFromJson(
    Map<String, dynamic> json) {
  return _UpdateDocsTitleReqModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateDocsTitleReqModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateDocsTitleReqModelCopyWith<UpdateDocsTitleReqModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDocsTitleReqModelCopyWith<$Res> {
  factory $UpdateDocsTitleReqModelCopyWith(UpdateDocsTitleReqModel value,
          $Res Function(UpdateDocsTitleReqModel) then) =
      _$UpdateDocsTitleReqModelCopyWithImpl<$Res, UpdateDocsTitleReqModel>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$UpdateDocsTitleReqModelCopyWithImpl<$Res,
        $Val extends UpdateDocsTitleReqModel>
    implements $UpdateDocsTitleReqModelCopyWith<$Res> {
  _$UpdateDocsTitleReqModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateDocsTitleReqModelImplCopyWith<$Res>
    implements $UpdateDocsTitleReqModelCopyWith<$Res> {
  factory _$$UpdateDocsTitleReqModelImplCopyWith(
          _$UpdateDocsTitleReqModelImpl value,
          $Res Function(_$UpdateDocsTitleReqModelImpl) then) =
      __$$UpdateDocsTitleReqModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$UpdateDocsTitleReqModelImplCopyWithImpl<$Res>
    extends _$UpdateDocsTitleReqModelCopyWithImpl<$Res,
        _$UpdateDocsTitleReqModelImpl>
    implements _$$UpdateDocsTitleReqModelImplCopyWith<$Res> {
  __$$UpdateDocsTitleReqModelImplCopyWithImpl(
      _$UpdateDocsTitleReqModelImpl _value,
      $Res Function(_$UpdateDocsTitleReqModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$UpdateDocsTitleReqModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateDocsTitleReqModelImpl implements _UpdateDocsTitleReqModel {
  _$UpdateDocsTitleReqModelImpl({required this.id, required this.title});

  factory _$UpdateDocsTitleReqModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateDocsTitleReqModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'UpdateDocsTitleReqModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDocsTitleReqModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDocsTitleReqModelImplCopyWith<_$UpdateDocsTitleReqModelImpl>
      get copyWith => __$$UpdateDocsTitleReqModelImplCopyWithImpl<
          _$UpdateDocsTitleReqModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDocsTitleReqModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateDocsTitleReqModel implements UpdateDocsTitleReqModel {
  factory _UpdateDocsTitleReqModel(
      {required final String id,
      required final String title}) = _$UpdateDocsTitleReqModelImpl;

  factory _UpdateDocsTitleReqModel.fromJson(Map<String, dynamic> json) =
      _$UpdateDocsTitleReqModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$UpdateDocsTitleReqModelImplCopyWith<_$UpdateDocsTitleReqModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
