import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/repository/app_property/already_launched_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('alreadyLaunched/saveLaunched', () async {
    final container = ProviderContainer(
      overrides: [
        appPropertyOverride(),
      ],
    );

    final alreadyLaunched =
        await container.read(alreadyLaunchedRepositoryProvider.future);
    expect(alreadyLaunched, isNull);

    await container
        .read(alreadyLaunchedRepositoryProvider.notifier)
        .markAsLaunched();

    container.invalidate(alreadyLaunchedRepositoryProvider);

    final newAlreadyLaunched =
        await container.read(alreadyLaunchedRepositoryProvider.future);
    expect(newAlreadyLaunched, isTrue);
  });
}
