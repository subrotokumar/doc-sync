import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/common/data/source/remote/user_data_client.dart';
import 'package:docsync/src/features/common/domain/entities/user_data.dart';
import 'package:docsync/src/features/common/domain/repositories/user_data.dart';

class UserDataRepositoryImpl extends UserDataRepository with BaseApiRepository {
  final UserDataClient client;
  UserDataRepositoryImpl(this.client);

  @override
  Future<DataState<ApiResponse<UserData>>> userData() {
    return getStateOf<ApiResponse<UserData>>(request: () => client.info());
  }
}
