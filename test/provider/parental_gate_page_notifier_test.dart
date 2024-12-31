import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/provider/parental_gate_page_notifier.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';

import '../mock/mock_box_data.dart';

void main() {
  setUp(
    () => AppPlatform.overridePlatForm = Platforms.iOS,
  );

  tearDown(() => AppPlatform.overridePlatForm = null);

  test('updateParentalControl', () async {
    final appProperty = appPropertyOverrideAndBox();

    final container = ProviderContainer(
      overrides: [
        appProperty.override,
      ],
    );

    await container
        .read(parentalGatePageNotifierProvider.notifier)
        .updateParentalControl(parentalControl: true);

    expect(appProperty.box.data[parentalControlKey], isTrue);
  });
}
