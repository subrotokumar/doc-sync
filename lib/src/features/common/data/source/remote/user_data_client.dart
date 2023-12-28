import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/common/data/models/user_data_model.dart';

part 'generated/user_data_client.g.dart';

@RestApi()
abstract class UserDataClient {
  factory UserDataClient(Dio dio) = _UserDataClient;

  @GET('/user/info')
  Future<HttpResponse<ApiResponse<UserDataModel>>> info();
}
