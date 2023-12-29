// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../docs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$docsRepositoryHash() => r'91b2d86591fe8f888f8ee2185adc3afe7e80dab0';

/// See also [docsRepository].
@ProviderFor(docsRepository)
final docsRepositoryProvider = AutoDisposeProvider<DocsRepository>.internal(
  docsRepository,
  name: r'docsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$docsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DocsRepositoryRef = AutoDisposeProviderRef<DocsRepository>;
String _$updateDocTitleUseCaseHash() =>
    r'4b880cfc6e886f129ace3462fee3daef78e4493b';

/// See also [updateDocTitleUseCase].
@ProviderFor(updateDocTitleUseCase)
final updateDocTitleUseCaseProvider =
    AutoDisposeProvider<UpdateDocTitleUseCase>.internal(
  updateDocTitleUseCase,
  name: r'updateDocTitleUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateDocTitleUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateDocTitleUseCaseRef
    = AutoDisposeProviderRef<UpdateDocTitleUseCase>;
String _$getDocByIdUseCaseHash() => r'8b7af56a4cd16c51dce42c5650b4ebcc8027444e';

/// See also [getDocByIdUseCase].
@ProviderFor(getDocByIdUseCase)
final getDocByIdUseCaseProvider =
    AutoDisposeProvider<GetDocByIdUseCase>.internal(
  getDocByIdUseCase,
  name: r'getDocByIdUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDocByIdUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDocByIdUseCaseRef = AutoDisposeProviderRef<GetDocByIdUseCase>;
String _$getDocByIdHash() => r'c2f16bf945bbc31b5506507295060cdf6ae74842';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getDocById].
@ProviderFor(getDocById)
const getDocByIdProvider = GetDocByIdFamily();

/// See also [getDocById].
class GetDocByIdFamily extends Family<AsyncValue<Docs>> {
  /// See also [getDocById].
  const GetDocByIdFamily();

  /// See also [getDocById].
  GetDocByIdProvider call(
    String id,
  ) {
    return GetDocByIdProvider(
      id,
    );
  }

  @override
  GetDocByIdProvider getProviderOverride(
    covariant GetDocByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getDocByIdProvider';
}

/// See also [getDocById].
class GetDocByIdProvider extends FutureProvider<Docs> {
  /// See also [getDocById].
  GetDocByIdProvider(
    String id,
  ) : this._internal(
          (ref) => getDocById(
            ref as GetDocByIdRef,
            id,
          ),
          from: getDocByIdProvider,
          name: r'getDocByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDocByIdHash,
          dependencies: GetDocByIdFamily._dependencies,
          allTransitiveDependencies:
              GetDocByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetDocByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Docs> Function(GetDocByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDocByIdProvider._internal(
        (ref) => create(ref as GetDocByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Docs> createElement() {
    return _GetDocByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDocByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDocByIdRef on FutureProviderRef<Docs> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetDocByIdProviderElement extends FutureProviderElement<Docs>
    with GetDocByIdRef {
  _GetDocByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetDocByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
