// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monsterListRepositoryHash() =>
    r'63b4115c27f51ae727757b1fcdaac788a527dd11';

/// [Monster]データに関するRepositoryです。
///
/// Copied from [MonsterListRepository].
@ProviderFor(MonsterListRepository)
final monsterListRepositoryProvider =
    AsyncNotifierProvider<MonsterListRepository, List<Monster>>.internal(
  MonsterListRepository.new,
  name: r'monsterListRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$monsterListRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MonsterListRepository = AsyncNotifier<List<Monster>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
