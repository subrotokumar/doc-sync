import 'package:dio/dio.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:retrofit/retrofit.dart';

import 'package:docsync/src/features/editor/data/models/docs_model.dart';

part 'generated/docs_client.g.dart';

@RestApi()
abstract class DocsClient {
  factory DocsClient(Dio dio) = _DocsClient;

  @POST('/docs/title')
  Future<HttpResponse<ApiResponse<DocsModel>>> updateDocsTitle(
    @Body() UpdateDocsTitleReqModel body,
  );

  @GET('/docs/{id}')
  Future<HttpResponse<ApiResponse<DocsModel>>> getDocById(
    @Path('id') String id,
  );
}
