import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_footer_info.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/fake_statistics_notifier.dart';

void main() {
  testWidgets('Daily', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizRange: diamondPearl,
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizFooterInfo(),
            ),
          ),
        ),
      ),
    );

    final formatMMdd = DateFormat('MM/dd');
    final dateLabel = formatMMdd.format(DateTime.now());
    expect(find.text('$dateLabel のもんだい'), findsOneWidget);
    expect(find.text('ダイヤモンド・パール'), findsOneWidget);
  });

  testWidgets('Endless', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizRange: diamondPearl,
          quizProcess: QuizProcessType.failure,
        ),
      ),
    );

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        lastChain: 10,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          statisticsProvider(QuizTypes.endless)
              .overrideWithValue(fakeStatisticsNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.endless,
            child: Scaffold(
              body: QuizFooterInfo(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('10 れんさ'), findsOneWidget);
  });

  testWidgets('Endless', (tester) async {
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizRange: diamondPearl,
          quizProcess: QuizProcessType.success,
        ),
      ),
    );

    final fakeStatisticsNotifier = FakeStatisticsNotifier(
      const QuizStatistics(
        lastChain: 10,
        currentChain: 7,
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          statisticsProvider(QuizTypes.endless)
              .overrideWithValue(fakeStatisticsNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.endless,
            child: Scaffold(
              body: QuizFooterInfo(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('7 れんさちゅう'), findsOneWidget);
  });
}
