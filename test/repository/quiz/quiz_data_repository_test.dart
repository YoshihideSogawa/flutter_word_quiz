import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/quiz/quiz_data_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('deleteAll()', () async {
    const quizTypes = QuizTypes.daily;
    const statistics = QuizStatistics(
      playCount: 5,
      clearCount: 4,
      currentChain: 2,
      maxChain: 3,
    );
    final quizOverride =
        quizOverrideAndBox(quizType: QuizTypes.daily, statistics: statistics);

    final container = ProviderContainer(
      overrides: [
        quizOverride.override,
      ],
    );

    await container
        .read(quizDataRepositoryProvider(QuizTypes.daily).notifier)
        .deleteAll();

    expect(quizOverride.box.data[quizTypes.boxName], isNull);
  });
}
