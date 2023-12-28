import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/home/data/models/document_model.dart';

part 'generated/docs_client.g.dart';

@RestApi()
abstract class DocsClient {
  factory DocsClient(Dio dio) = _DocsClient;

  @GET('/document/me')
  Future<HttpResponse<ApiResponse<MyDocumentModel>>> myDocument();

  @GET('/document/create')
  Future<HttpResponse<ApiResponse<DocumentModel>>> createDocument();
}
