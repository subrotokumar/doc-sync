import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';

abstract class UserRepository {
  Future<void> register(AuthUserReq body);
  Future<void> login(AuthUserReq body);
  Future<void> refresh(String refresh);
  Future<void> logout();
}
