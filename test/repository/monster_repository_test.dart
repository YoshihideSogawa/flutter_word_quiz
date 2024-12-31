import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

void main() {
  test('モンスター一覧読み込みテスト', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();
    final monsterList =
        await container.read(monsterListRepositoryProvider.future);

    expect(monsterList[0].id, 1);
    expect(monsterList[0].name, 'フシギダネ');
    expect(monsterList.length, 905);
  });

  test('pickMonster', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();

    final monster = await container
        .read(monsterListRepositoryProvider.notifier)
        .pick(range: const QuizRange(maxNo: 40), seed: 20220313);
    expect(monster.id, 9);
  });

  test('pickRandom', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();

    final monster =
        await container.read(monsterListRepositoryProvider.notifier).pick();
    expect(monster.id, isNotNull);
    expect(monster.name, isNotNull);
  });
}
