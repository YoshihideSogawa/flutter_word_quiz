// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'already_launched_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$alreadyLaunchedRepositoryHash() =>
    r'f79916ccadc42caf07cef5fd88f5de26336c4c1e';

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
