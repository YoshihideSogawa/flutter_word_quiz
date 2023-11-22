// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monsterListRepositoryHash() =>
    r'f5c96ff19e7027dc7cc6544cd0081a350b85213d';

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
