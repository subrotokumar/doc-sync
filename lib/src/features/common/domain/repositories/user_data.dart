import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/common/domain/entities/user_data.dart';

abstract class UserDataRepository {
  Future<DataState<ApiResponse<UserData>>> userData();
}
