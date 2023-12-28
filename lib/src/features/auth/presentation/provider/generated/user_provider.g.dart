// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'8f9ee4004eb83e57ff738cdcdf77bfea7d676972';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$loginUseCaseHash() => r'90247e1e9166fa7123d9ac7000ce8133e1850696';

/// See also [loginUseCase].
@ProviderFor(loginUseCase)
final loginUseCaseProvider = AutoDisposeProvider<LoginUseCase>.internal(
  loginUseCase,
  name: r'loginUseCaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginUseCaseRef = AutoDisposeProviderRef<LoginUseCase>;
String _$refreshTokenUseCaseHash() =>
    r'42aefbc1ecc814ca7c6118479ca9879fd25fe36c';

/// See also [refreshTokenUseCase].
@ProviderFor(refreshTokenUseCase)
final refreshTokenUseCaseProvider =
    AutoDisposeProvider<RefreshTokenUseCase>.internal(
  refreshTokenUseCase,
  name: r'refreshTokenUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$refreshTokenUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RefreshTokenUseCaseRef = AutoDisposeProviderRef<RefreshTokenUseCase>;
String _$logoutUseCaseHash() => r'28ad3ed9cb6312915e69400f5ed531cf9ac7168c';

/// See also [logoutUseCase].
@ProviderFor(logoutUseCase)
final logoutUseCaseProvider = AutoDisposeProvider<LogoutUseCase>.internal(
  logoutUseCase,
  name: r'logoutUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logoutUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogoutUseCaseRef = AutoDisposeProviderRef<LogoutUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
