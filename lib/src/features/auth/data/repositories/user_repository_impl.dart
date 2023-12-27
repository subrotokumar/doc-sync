// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/features/auth/data/models/auth_user_request.dart';
import 'package:docsync/src/features/auth/data/source/remote/auth_client.dart';
import 'package:docsync/src/features/auth/domain/entities/auth_user_req.dart';
import 'package:docsync/src/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository with BaseApiRepository {
  final UserClient client;

  UserRepositoryImpl({
    required this.client,
  });

  @override
  Future<DataState<void>> login(AuthUserReq body) {
    return getStateOf<void>(
      request: () => client.login(AuthUserRequest(
        username: body.username,
        password: body.password,
        email: body.email,
      )),
    );
  }

  @override
  Future<DataState<void>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> refresh(String refresh) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> register(AuthUserReq body) {
    return getStateOf<void>(
      request: () => client.register(AuthUserRequest(
        username: body.username,
        password: body.password,
        email: body.email,
      )),
    );
  }
}
