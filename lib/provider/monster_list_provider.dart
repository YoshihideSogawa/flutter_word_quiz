import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/repository/monster_repository.dart';

/// モンスター一覧のProvider
final monsterListProvider = FutureProvider<List<Monster>>((ref) async {
  return ref.watch(monsterRepositoryProvider).load();
});
