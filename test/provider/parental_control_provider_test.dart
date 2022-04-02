import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  test('isParentalControl', () async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.parentalControl()).thenReturn(true);

    final container = ProviderContainer(
      overrides: [
        appPropertyRepositoryProvider
            .overrideWithValue(mockAppPropertyRepository),
      ],
    );

    expect(container.read(parentalControlProvider).isParentalControl(), isTrue);
  });
}
