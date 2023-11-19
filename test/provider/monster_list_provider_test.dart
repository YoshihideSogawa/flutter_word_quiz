import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

import '../mock/fake_monster_list_repository.dart';

void main() {
  test('monsterListProvider', () async {
    final container = ProviderContainer(
      overrides: [
        monsterListRepositoryProvider
            .overrideWith(FakeMonsterListRepository.new),
      ],
    );
    final monsterList =
        await container.read(monsterListRepositoryProvider.future);

    expect(monsterList.length, 50);
  });
}
