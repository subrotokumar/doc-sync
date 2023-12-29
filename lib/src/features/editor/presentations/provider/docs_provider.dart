import 'package:docsync/src/features/editor/domain/entities/docs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:docsync/src/features/common/presentation/providers/provider.dart';
import 'package:docsync/src/features/editor/data/repositories/docs_repositories.dart';
import 'package:docsync/src/features/editor/data/source/remote/docs_client.dart';
import 'package:docsync/src/features/editor/domain/repositories/docs_repositories.dart';
import 'package:docsync/src/features/editor/domain/usecase/docs_usecase.dart';

part 'generated/docs_provider.g.dart';

@riverpod
DocsRepository docsRepository(DocsRepositoryRef ref) {
  final dio = ref.read(dioProvider());
  return DocsRepositoryImpl(client: DocsClient(dio));
}

@riverpod
UpdateDocTitleUseCase updateDocTitleUseCase(UpdateDocTitleUseCaseRef ref) {
  final docsRepository = ref.read(docsRepositoryProvider);
  return UpdateDocTitleUseCase(docsRepository);
}

@riverpod
GetDocByIdUseCase getDocByIdUseCase(GetDocByIdUseCaseRef ref) {
  final docsRepository = ref.read(docsRepositoryProvider);
  return GetDocByIdUseCase(docsRepository);
}

@Riverpod(keepAlive: true)
Future<Docs> getDocById(GetDocByIdRef ref, String id) async {
  final res = await ref.read(getDocByIdUseCaseProvider).call(id);
  return res.data!.data!;
}
