import 'package:docsync/src/core/resource/data_state.dart';

abstract class BaseParamsUseCase<Type, Request> {
  Future<DataState<Type>> call(Request params);
}

class NoParam {}
