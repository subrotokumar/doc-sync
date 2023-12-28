import 'package:dio/dio.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/auth/data/models/auth_user_request.dart';
import 'package:docsync/src/features/auth/data/models/login_user_response.dart';
import 'package:docsync/src/features/auth/data/models/refresh_token_request.dart';
import 'package:docsync/src/features/auth/data/models/refresh_token_response.dart';
import 'package:docsync/src/features/auth/data/models/register_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/auth_client.g.dart';

//
@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio) = _UserClient;

  @POST('/user/register')
  Future<HttpResponse<ApiResponse<RegisterUserResponse>>> register(
    @Body() AuthUserRequest body,
  );

  @POST('/user/login')
  Future<HttpResponse<ApiResponse<LoginUserResponse>>> login(
    @Body() AuthUserRequest body,
  );

  @POST('/user/refresh')
  Future<HttpResponse<ApiResponse<RefreshTokenResponse>>> refresh(
    @Body() RefreshTokenRequest body,
  );

  @POST('/user/logout')
  Future<HttpResponse<void>> logout(
    @Header('Authorization') String authorization,
  );

  @POST('/user/info')
  Future<HttpResponse<void>> info();
}
