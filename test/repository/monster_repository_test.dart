import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

void main() {
  testWidgets('モンスター一覧読み込みテスト', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final container = ProviderContainer();
    final monsterList =
        await container.read(monsterListRepositoryProvider.future);

    expect(monsterList[0].id, 1);
    expect(monsterList[0].name, 'フシギダネ');
  });
}
