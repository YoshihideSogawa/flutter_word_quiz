import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/provider/splash_page_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  test('showFirstRule(初回起動)', () async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(false);

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    final splashPageInfo = await container.read(splashPageProvider.future);
    expect(splashPageInfo.showRule, isTrue);
  });

  test('showFirstRule(起動済み)', () async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(true);

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    final splashPageInfo = await container.read(splashPageProvider.future);
    expect(splashPageInfo.showRule, isFalse);
  });
}
