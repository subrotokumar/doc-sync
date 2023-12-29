import 'package:docsync/src/features/home/domain/entities/document.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:docsync/src/features/common/presentation/providers/provider.dart';
import 'package:docsync/src/features/home/data/repositories/document_repositories.dart';
import 'package:docsync/src/features/home/data/sources/remote/document_client.dart';
import 'package:docsync/src/features/home/domain/repositories/document_repository.dart';
import 'package:docsync/src/features/home/domain/usecase/document_usecase.dart';

part 'generated/document_provider.g.dart';

@riverpod
DocumentRepository documentRepository(DocumentRepositoryRef ref) {
  final dio = ref.read(dioProvider());
  return DocumentRepositoryImpl(DocumentClient(dio));
}

@Riverpod(keepAlive: true)
GetDocumentsUseCase getDocumentsUseCase(GetDocumentsUseCaseRef ref) {
  final dio = ref.read(dioProvider(useIsolate: true));
  final repo = DocumentRepositoryImpl(DocumentClient(dio));
  return GetDocumentsUseCase(repo);
}

@riverpod
CreateDocumentUseCase createDocumentUserCase(CreateDocumentUserCaseRef ref) {
  final documentRepository = ref.read(documentRepositoryProvider);
  return CreateDocumentUseCase(documentRepository);
}

@Riverpod(keepAlive: true)
Future<List<Document>> getDocuments(Ref ref) async {
  final res = await ref.read(getDocumentsUseCaseProvider).call();
  return res.data?.data?.docs ?? [];
}
