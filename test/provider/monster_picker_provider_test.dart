import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/provider/monster_picker_provider.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

import '../mock/fake_monster_list_repository.dart';
import '../mock/generate_mocks.mocks.dart';
import '../mock/monster_test_list.dart';

void main() {
  test('pickMonster', () async {
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    final monster = await container
        .read(monsterPickerProvider)
        .pick(range: const QuizRange(maxNo: 40), seed: 20220313);
    expect(monster.id, 9);
  });

  test('pickRandom', () async {
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );

    final monster = await container.read(monsterPickerProvider).pick();
    expect(monster.id, isNotNull);
    expect(monster.name, isNotNull);
  });
}
