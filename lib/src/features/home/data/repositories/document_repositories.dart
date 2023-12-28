import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/home/data/sources/remote/docs_client.dart';
import 'package:docsync/src/features/home/domain/entities/document.dart';
import 'package:docsync/src/features/home/domain/repositories/document_repository.dart';

class DocumentRepositoryImpl extends DocumentRepository with BaseApiRepository {
  final DocsClient client;
  DocumentRepositoryImpl(this.client);

  @override
  Future<DataState<ApiResponse<Document>>> createDocument() {
    return getStateOf(request: () => client.createDocument());
  }

  @override
  Future<DataState<ApiResponse<MyDocuments>>> getDocument() {
    return getStateOf(request: () => client.myDocument());
  }
}
