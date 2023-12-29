// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'3293679c4657e88d519d06721ef99c4013172783';

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

/// See also [dio].
@ProviderFor(dio)
const dioProvider = DioFamily();

/// See also [dio].
class DioFamily extends Family<Dio> {
  /// See also [dio].
  const DioFamily();

  /// See also [dio].
  DioProvider call({
    bool useIsolate = false,
    bool useRefreshInterceptor = true,
  }) {
    return DioProvider(
      useIsolate: useIsolate,
      useRefreshInterceptor: useRefreshInterceptor,
    );
  }

  @override
  DioProvider getProviderOverride(
    covariant DioProvider provider,
  ) {
    return call(
      useIsolate: provider.useIsolate,
      useRefreshInterceptor: provider.useRefreshInterceptor,
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
  String? get name => r'dioProvider';
}

/// See also [dio].
class DioProvider extends Provider<Dio> {
  /// See also [dio].
  DioProvider({
    bool useIsolate = false,
    bool useRefreshInterceptor = true,
  }) : this._internal(
          (ref) => dio(
            ref as DioRef,
            useIsolate: useIsolate,
            useRefreshInterceptor: useRefreshInterceptor,
          ),
          from: dioProvider,
          name: r'dioProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
          dependencies: DioFamily._dependencies,
          allTransitiveDependencies: DioFamily._allTransitiveDependencies,
          useIsolate: useIsolate,
          useRefreshInterceptor: useRefreshInterceptor,
        );

  DioProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.useIsolate,
    required this.useRefreshInterceptor,
  }) : super.internal();

  final bool useIsolate;
  final bool useRefreshInterceptor;

  @override
  Override overrideWith(
    Dio Function(DioRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DioProvider._internal(
        (ref) => create(ref as DioRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        useIsolate: useIsolate,
        useRefreshInterceptor: useRefreshInterceptor,
      ),
    );
  }

  @override
  ProviderElement<Dio> createElement() {
    return _DioProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DioProvider &&
        other.useIsolate == useIsolate &&
        other.useRefreshInterceptor == useRefreshInterceptor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, useIsolate.hashCode);
    hash = _SystemHash.combine(hash, useRefreshInterceptor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DioRef on ProviderRef<Dio> {
  /// The parameter `useIsolate` of this provider.
  bool get useIsolate;

  /// The parameter `useRefreshInterceptor` of this provider.
  bool get useRefreshInterceptor;
}

class _DioProviderElement extends ProviderElement<Dio> with DioRef {
  _DioProviderElement(super.provider);

  @override
  bool get useIsolate => (origin as DioProvider).useIsolate;
  @override
  bool get useRefreshInterceptor =>
      (origin as DioProvider).useRefreshInterceptor;
}

String _$accessTokenHash() => r'b5b51191fedafd9e5c4298c33e8f4c2ef13389ff';

/// See also [AccessToken].
@ProviderFor(AccessToken)
final accessTokenProvider = NotifierProvider<AccessToken, String>.internal(
  AccessToken.new,
  name: r'accessTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accessTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AccessToken = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
