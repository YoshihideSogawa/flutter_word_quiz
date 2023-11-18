import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/already_launched_repository.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

import '../../mock/mock_hive_box.dart';

void main() {
  test('alreadyLaunched/saveLaunched', () async {
    final box = MockHiveBox<dynamic>();

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(appPropertyBoxName).overrideWith((ref) => box),
      ],
    );

    final alreadyLaunched =
        await container.read(alreadyLaunchedRepositoryProvider.future);
    expect(alreadyLaunched, isNull);

    await container
        .read(alreadyLaunchedRepositoryProvider.notifier)
        .markAsLaunched();

    final newAlreadyLaunched =
        await container.read(alreadyLaunchedRepositoryProvider.future);
    expect(newAlreadyLaunched, isTrue);
  });
}
