// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'already_launched_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$alreadyLaunchedRepositoryHash() =>
    r'12a7f3a721356e3b97d821fa9ca0b1012b2b2614';

/// アプリが1度でも起動済みか取得します。
///
/// Copied from [AlreadyLaunchedRepository].
@ProviderFor(AlreadyLaunchedRepository)
final alreadyLaunchedRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<AlreadyLaunchedRepository, bool?>.internal(
  AlreadyLaunchedRepository.new,
  name: r'alreadyLaunchedRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$alreadyLaunchedRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AlreadyLaunchedRepository = AutoDisposeAsyncNotifier<bool?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
