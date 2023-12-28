import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:docsync/src/features/auth/domain/entities/login_user_res.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_req.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_res.dart';
import 'package:docsync/src/features/auth/domain/entities/register_user_res.dart';
import 'package:docsync/src/features/auth/domain/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;
  LoginUseCase(this.userRepository);

  Future<DataState<ApiResponse<LoginUserRes>>> call(AuthUserReq body) {
    return userRepository.login(body);
  }
}

class RegisterUseCase {
  final UserRepository userRepository;
  RegisterUseCase(this.userRepository);

  Future<DataState<ApiResponse<RegisterUserRes>>> call(AuthUserReq body) {
    return userRepository.register(body);
  }
}

class RefreshTokenUseCase {
  final UserRepository userRepository;
  RefreshTokenUseCase(this.userRepository);

  Future<DataState<ApiResponse<RefreshTokenRes>>> call(RefreshTokenReq body) {
    return userRepository.refresh(body);
  }
}

class LogoutUseCase {
  final UserRepository userRepository;
  LogoutUseCase(this.userRepository);

  Future<DataState<void>> call(String accessToken) {
    return userRepository.logout(accessToken);
  }
}

class InfoUseCase {
  final UserRepository userRepository;
  InfoUseCase(this.userRepository);

  Future<DataState<void>> call(String accessToken) {
    return userRepository.logout(accessToken);
  }
}
