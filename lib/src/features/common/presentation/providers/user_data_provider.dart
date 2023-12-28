import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:docsync/src/features/common/data/models/user_data_model.dart';
import 'package:docsync/src/features/common/data/repositories/user_repository.dart';
import 'package:docsync/src/features/common/data/source/remote/user_data_client.dart';
import 'package:docsync/src/features/common/domain/repositories/user_data.dart';
import 'package:docsync/src/features/common/domain/usecase/user_data_usecase.dart';
import 'package:docsync/src/features/common/presentation/providers/provider.dart';

part 'generated/user_data_provider.g.dart';

@riverpod
UserDataRepository userDataRepository(UserDataRepositoryRef ref) {
  final dio = ref.read(dioProvider());
  return UserDataRepositoryImpl(UserDataClient(dio));
}

@riverpod
UserDataUseCase userDataUseCase(UserDataUseCaseRef ref) {
  final userDataRepository = ref.read(userDataRepositoryProvider);
  return UserDataUseCase(userDataRepository);
}

@Riverpod(keepAlive: true)
Future<UserDataModel> userInfo(UserInfoRef ref) async {
  final response = await ref.read(userDataUseCaseProvider).call();
  final info = response.data!.data!;
  return UserDataModel(
    id: info.id,
    username: info.username,
    email: info.email,
    avatar: info.avatar,
  );
}
