import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

extension DataStateWhen<T> on DataState<T> {
  void _voidFunc() {}

  dynamic when({
    dynamic Function()? initial,
    required dynamic Function(T data) success,
    required dynamic Function(DioException error) failed,
  }) {
    if (this is DataSuccess<T>) {
      return success(data as T);
    } else if (this is DataFailed<T>) {
      return failed(error as DioException);
    } else {
      return (initial ?? _voidFunc)();
    }
  }

  dynamic whenSuccess(
    dynamic Function(T data) success, {
    dynamic Function()? onElse,
  }) {
    if (this is DataSuccess<T>) {
      return success(data as T);
    } else {
      return (onElse ?? _voidFunc)();
    }
  }
}
