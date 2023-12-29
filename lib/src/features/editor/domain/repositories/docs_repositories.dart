import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/editor/domain/entities/docs.dart';

abstract class DocsRepository {
  Future<DataState<ApiResponse<Docs>>> updateDocTitle(UpdateDocsTitleReq body);
  Future<DataState<ApiResponse<Docs>>> getDocById(String id);
}
