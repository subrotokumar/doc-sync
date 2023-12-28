// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/common/domain/entities/user_data.dart';
import 'package:docsync/src/features/common/domain/repositories/user_data.dart';

class UserDataUseCase {
  final UserDataRepository userDataRepository;
  UserDataUseCase(this.userDataRepository);

  Future<DataState<ApiResponse<UserData>>> call() async {
    return userDataRepository.userData();
  }
}
