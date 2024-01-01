import 'package:docsync/src/core/core.dart';
import 'package:docsync/src/core/resource/api_response.dart';
import 'package:docsync/src/features/home/domain/entities/document.dart';

abstract class DocumentRepository {
  Future<DataState<ApiResponse<MyDocuments>>> getDocument();
  Future<DataState<ApiResponse<Document>>> createDocument();
  Future<DataState<void>> deleteDocument(String id);
}
