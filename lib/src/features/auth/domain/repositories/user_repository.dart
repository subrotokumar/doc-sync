import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:docsync/src/features/auth/domain/entities/login_user_res.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_req.dart';
import 'package:docsync/src/features/auth/domain/entities/refresh_token_res.dart';
import 'package:docsync/src/features/auth/domain/entities/register_user_res.dart';

abstract class UserRepository {
  Future<DataState<ApiResponse<RegisterUserRes>>> register(AuthUserReq body);
  Future<DataState<ApiResponse<LoginUserRes>>> login(AuthUserReq body);
  Future<DataState<ApiResponse<RefreshTokenRes>>> refresh(RefreshTokenReq body);
  Future<DataState<void>> logout();
}
