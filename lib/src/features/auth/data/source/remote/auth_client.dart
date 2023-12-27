import 'package:dio/dio.dart';
import 'package:docsync/src/features/auth/data/models/auth_user_request.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/auth_client.g.dart';

@RestApi(baseUrl: 'https://localhost:3001/api/v1/')
abstract class UserClient {
  factory UserClient(Dio dio) = _UserClient;

  @POST('/user/register')
  Future<HttpResponse> register(
    @Body() AuthUserRequest body,
  );

  @POST('/user/login')
  Future<HttpResponse> login(
    @Body() AuthUserRequest body,
  );

  @POST('/user/refresh')
  Future<HttpResponse> refresh();

  @POST('/user/logout')
  Future<HttpResponse> logout();
}
