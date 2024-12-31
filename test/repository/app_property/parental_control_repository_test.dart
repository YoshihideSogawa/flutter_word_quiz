import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  setUp(() => AppPlatform.overridePlatForm = Platforms.iOS);

  tearDown(() => AppPlatform.overridePlatForm = null);

  test('parentalControl/saveParentalControl', () async {
    final container = ProviderContainer(
      overrides: [
        appPropertyOverride(),
      ],
    );

    final isParentalControl =
        await container.read(parentalControlRepositoryProvider.future);
    expect(isParentalControl, isTrue);

    await container
        .read(parentalControlRepositoryProvider.notifier)
        .saveParentalControl(parentalControl: false);

    final isNewParentalControl =
        await container.read(parentalControlRepositoryProvider.future);
    expect(isNewParentalControl, isFalse);
  });
}
