import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/provider/splash_page_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
  });

  test('showFirstRule(初回起動)', () async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(false);
    when(mockAppPropertyRepository.parentalControl()).thenReturn(false);

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    // await container.read(splashPageProvider.notifier).init();
    // final splashPageInfo = container.read(splashPageProvider).value!;
    // expect(splashPageInfo.showRule, isTrue);
  });

  test('showFirstRule(起動済み)', () async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(true);
    when(mockAppPropertyRepository.parentalControl()).thenReturn(false);

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(splashPageProvider.notifier).init();
    final splashPageInfo = container.read(splashPageProvider).value!;
    expect(splashPageInfo.showRule, isFalse);
  });

  test('初回起動', () async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(false);
    when(mockAppPropertyRepository.parentalControl()).thenReturn(null);

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    // TODO(sogawa): すぐには書き換えられないので、一旦このまま進めてNotifierで書き換える
    // ignore: invalid_use_of_visible_for_testing_member
    await container.read(splashPageProvider.notifier).init();
    final splashPageInfo = container.read(splashPageProvider).value!;
    // expect(splashPageInfo.showRule, isTrue);
    //
    // verify(
    //   mockAppPropertyRepository.saveParentalControl(
    //     parentalControl: false,
    //   ),
    // ).called(1);
  });
}
