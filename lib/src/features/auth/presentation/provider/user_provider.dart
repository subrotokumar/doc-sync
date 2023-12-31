import 'package:docsync/src/features/auth/data/repositories/user_repository_impl.dart';
import 'package:docsync/src/features/auth/data/source/remote/auth_client.dart';
import 'package:docsync/src/features/auth/domain/repositories/user_repository.dart';
import 'package:docsync/src/features/auth/domain/usecase/user_usecase.dart';
import 'package:docsync/src/features/common/presentation/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generated/user_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  final dio = ref.read(dioProvider());
  return UserRepositoryImpl(client: UserClient(dio));
}

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return LoginUseCase(userRepository);
}

@riverpod
RegisterUseCase registerUseCase(RegisterUseCaseRef ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return RegisterUseCase(userRepository);
}

@riverpod
RefreshTokenUseCase refreshTokenUseCase(RefreshTokenUseCaseRef ref) {
  final dio = ref.read(dioProvider(useRefreshInterceptor: false));
  final userRepository = UserRepositoryImpl(client: UserClient(dio));
  return RefreshTokenUseCase(userRepository);
}

@riverpod
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return LogoutUseCase(userRepository);
}
