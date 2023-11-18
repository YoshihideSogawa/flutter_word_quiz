import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

import '../../mock/mock_hive_box.dart';

void main() {
  test('parentalControl/saveParentalControl', () async {
    final box = MockHiveBox<dynamic>();

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(appPropertyBoxName).overrideWith((ref) => box),
      ],
    );

    final isParentalControl =
        await container.read(parentalControlRepositoryProvider.future);
    expect(isParentalControl, isNull);

    await container
        .read(parentalControlRepositoryProvider.notifier)
        .saveParentalControl(parentalControl: true);

    final isNewParentalControl =
        await container.read(parentalControlRepositoryProvider.future);
    expect(isNewParentalControl, isTrue);
  });
}
