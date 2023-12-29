import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/editor/domain/entities/docs.dart';
import 'package:docsync/src/features/editor/domain/repositories/docs_repositories.dart';

class GetDocByIdUseCase {
  final DocsRepository repository;
  GetDocByIdUseCase(this.repository);

  Future<DataState<ApiResponse<Docs>>> call(String id) async {
    return await repository.getDocById(id);
  }
}

class UpdateDocTitleUseCase {
  final DocsRepository repository;
  UpdateDocTitleUseCase(this.repository);

  Future<DataState<ApiResponse<Docs>>> call(UpdateDocsTitleReq body) async {
    return await repository.updateDocTitle(body);
  }
}
