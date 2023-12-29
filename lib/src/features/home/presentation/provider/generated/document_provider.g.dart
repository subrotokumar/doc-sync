// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../document_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentRepositoryHash() =>
    r'534e9b8ee3e6559571c21a3f8442c9d385d1510b';

/// See also [documentRepository].
@ProviderFor(documentRepository)
final documentRepositoryProvider =
    AutoDisposeProvider<DocumentRepository>.internal(
  documentRepository,
  name: r'documentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$documentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DocumentRepositoryRef = AutoDisposeProviderRef<DocumentRepository>;
String _$getDocumentsUseCaseHash() =>
    r'b50fb2ecea48c7ed42ef04df05afeff417ca04de';

/// See also [getDocumentsUseCase].
@ProviderFor(getDocumentsUseCase)
final getDocumentsUseCaseProvider = Provider<GetDocumentsUseCase>.internal(
  getDocumentsUseCase,
  name: r'getDocumentsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDocumentsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDocumentsUseCaseRef = ProviderRef<GetDocumentsUseCase>;
String _$createDocumentUserCaseHash() =>
    r'89231158c50d94813cf8a9648215f1f153ef2db5';

/// See also [createDocumentUserCase].
@ProviderFor(createDocumentUserCase)
final createDocumentUserCaseProvider =
    AutoDisposeProvider<CreateDocumentUseCase>.internal(
  createDocumentUserCase,
  name: r'createDocumentUserCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createDocumentUserCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreateDocumentUserCaseRef
    = AutoDisposeProviderRef<CreateDocumentUseCase>;
String _$getDocumentsHash() => r'69d40a8a00b0d9fdd49d797e9abe00a6ac0e9222';

/// See also [getDocuments].
@ProviderFor(getDocuments)
final getDocumentsProvider = FutureProvider<List<Document>>.internal(
  getDocuments,
  name: r'getDocumentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDocumentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDocumentsRef = FutureProviderRef<List<Document>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
