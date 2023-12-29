// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/editor/data/models/docs_model.dart';
import 'package:docsync/src/features/editor/data/source/remote/docs_client.dart';
import 'package:docsync/src/features/editor/domain/entities/docs.dart';
import 'package:docsync/src/features/editor/domain/repositories/docs_repositories.dart';

class DocsRepositoryImpl extends DocsRepository with BaseApiRepository {
  final DocsClient client;
  DocsRepositoryImpl({
    required this.client,
  });

  @override
  Future<DataState<ApiResponse<Docs>>> getDocById(String id) {
    return getStateOf(request: () => client.getDocById(id));
  }

  @override
  Future<DataState<ApiResponse<Docs>>> updateDocTitle(UpdateDocsTitleReq body) {
    return getStateOf(
      request: () => client.updateDocsTitle(UpdateDocsTitleReqModel(
        id: body.id,
        title: body.title,
      )),
    );
  }
}
