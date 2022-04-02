import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/provider/parental_gate_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  test('pick()', () {
    final container = ProviderContainer();
    final parentalGatePage = container.read(parentalGatePageProvider);
    expect(parentalGatePage.answerNum, 1);
    expect(parentalGatePage.maxAnswerNum, 3);
    expect(parentalGatePage.targetData, isNotNull);
  });

  test('updateParentalControl()', () {
    final mockAppPropertyRepository = MockAppPropertyRepository();

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    container
        .read(parentalGatePageProvider.notifier)
        .updateParentalControl(parentalControl: true);

    verify(mockAppPropertyRepository.saveParentalControl(parentalControl: true))
        .called(1);
  });
}
