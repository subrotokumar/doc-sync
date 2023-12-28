import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/home/domain/entities/document.dart';
import 'package:docsync/src/features/home/domain/repositories/document_repository.dart';

class CreateDocumentUseCase {
  final DocumentRepository documentRepository;
  CreateDocumentUseCase(this.documentRepository);

  Future<DataState<ApiResponse<dynamic>>> call() async {
    return documentRepository.createDocument();
  }
}

class GetDocumentsUseCase {
  final DocumentRepository documentRepository;
  GetDocumentsUseCase(this.documentRepository);

  Future<DataState<ApiResponse<MyDocuments>>> call() async {
    return documentRepository.getDocument();
  }
}
