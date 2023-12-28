import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/auth/data/models/auth_user_request.dart';
import 'package:docsync/src/features/auth/data/models/login_user_response.dart';
import 'package:docsync/src/features/auth/data/models/refresh_token_request.dart';
import 'package:docsync/src/features/auth/data/models/refresh_token_response.dart';
import 'package:docsync/src/features/auth/data/models/register_user_response.dart';
import 'package:docsync/src/features/auth/data/source/remote/auth_client.dart';
import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_req.dart';
import 'package:docsync/src/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository with BaseApiRepository {
  final UserClient client;

  UserRepositoryImpl({
    required this.client,
  });

  @override
  Future<DataState<ApiResponse<LoginUserResponse>>> login(AuthUserReq body) {
    return getStateOf<ApiResponse<LoginUserResponse>>(
      request: () => client.login(
        AuthUserRequest(
          username: body.username,
          password: body.password,
          email: body.email,
        ),
      ),
    );
  }

  @override
  Future<DataState<void>> logout(String accessToken) {
    return getStateOf<void>(
      request: () => client.logout('Bearer $accessToken'),
    );
  }

  @override
  Future<DataState<ApiResponse<RefreshTokenResponse>>> refresh(
      RefreshTokenReq body) {
    return getStateOf<ApiResponse<RefreshTokenResponse>>(
      request: () => client.refresh(
        RefreshTokenRequest(refresh: body.refresh),
      ),
    );
  }

  @override
  Future<DataState<ApiResponse<RegisterUserResponse>>> register(
      AuthUserReq body) {
    return getStateOf<ApiResponse<RegisterUserResponse>>(
      request: () => client.register(
        AuthUserRequest(
          username: body.username,
          password: body.password,
          email: body.email,
        ),
      ),
    );
  }
}
