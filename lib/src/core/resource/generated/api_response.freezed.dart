// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return ApiResponseData<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({int statusCode, String message, bool success, T? data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseDataImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseDataImplCopyWith(_$ApiResponseDataImpl<T> value,
          $Res Function(_$ApiResponseDataImpl<T>) then) =
      __$$ApiResponseDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int statusCode, String message, bool success, T? data});
}

/// @nodoc
class __$$ApiResponseDataImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseDataImpl<T>>
    implements _$$ApiResponseDataImplCopyWith<T, $Res> {
  __$$ApiResponseDataImplCopyWithImpl(_$ApiResponseDataImpl<T> _value,
      $Res Function(_$ApiResponseDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_$ApiResponseDataImpl<T>(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseDataImpl<T> implements ApiResponseData<T> {
  const _$ApiResponseDataImpl(
      {required this.statusCode,
      required this.message,
      required this.success,
      this.data});

  factory _$ApiResponseDataImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiResponseDataImplFromJson(json, fromJsonT);

  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiResponse<$T>(statusCode: $statusCode, message: $message, success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseDataImpl<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, success,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseDataImplCopyWith<T, _$ApiResponseDataImpl<T>> get copyWith =>
      __$$ApiResponseDataImplCopyWithImpl<T, _$ApiResponseDataImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseDataImplToJson<T>(this, toJsonT);
  }
}

abstract class ApiResponseData<T> implements ApiResponse<T> {
  const factory ApiResponseData(
      {required final int statusCode,
      required final String message,
      required final bool success,
      final T? data}) = _$ApiResponseDataImpl<T>;

  factory ApiResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiResponseDataImpl<T>.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  bool get success;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseDataImplCopyWith<T, _$ApiResponseDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
