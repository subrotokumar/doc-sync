// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataRepositoryHash() =>
    r'd4564cc809f508a35adc9c7c493186143689a64b';

/// See also [userDataRepository].
@ProviderFor(userDataRepository)
final userDataRepositoryProvider =
    AutoDisposeProvider<UserDataRepository>.internal(
  userDataRepository,
  name: r'userDataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDataRepositoryRef = AutoDisposeProviderRef<UserDataRepository>;
String _$userDataUseCaseHash() => r'cc711a8a4ce50d4c802b2666d7397b7631366261';

/// See also [userDataUseCase].
@ProviderFor(userDataUseCase)
final userDataUseCaseProvider = AutoDisposeProvider<UserDataUseCase>.internal(
  userDataUseCase,
  name: r'userDataUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDataUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDataUseCaseRef = AutoDisposeProviderRef<UserDataUseCase>;
String _$userInfoHash() => r'17c6e321f61dadd0e68e59b19d2969a2b8bc28b3';

/// See also [userInfo].
@ProviderFor(userInfo)
final userInfoProvider = FutureProvider<UserDataModel>.internal(
  userInfo,
  name: r'userInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserInfoRef = FutureProviderRef<UserDataModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
