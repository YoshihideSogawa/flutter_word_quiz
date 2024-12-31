import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_footer_info.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('Daily', (tester) async {
    const quizType = QuizTypes.daily;
    const quizInfo = QuizInfo(
      quizRange: diamondPearl,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, quizInfo: quizInfo),
          // quizInfoProvider(quizType)
          //     .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: QuizFooterInfo(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final formatMMdd = DateFormat('MM/dd');
    final dateLabel = formatMMdd.format(DateTime.now());
    expect(find.text('$dateLabel のもんだい'), findsOneWidget);
    expect(find.text('ダイヤモンド・パール'), findsOneWidget);
  });

  testWidgets('Endless(連鎖終了)', (tester) async {
    const quizType = QuizTypes.endless;
    const quizInfo = QuizInfo(
      quizRange: diamondPearl,
      quizProcess: QuizProcessType.failure,
    );

    const quizStatistics = QuizStatistics(
      lastChain: 10,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            statistics: quizStatistics,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: QuizFooterInfo(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('10 れんさ'), findsOneWidget);
  });

  testWidgets('Endless(連鎖中)', (tester) async {
    const quizType = QuizTypes.endless;
    const quizInfo = QuizInfo(
      quizRange: diamondPearl,
      quizProcess: QuizProcessType.success,
    );

    const quizStatistics = QuizStatistics(
      lastChain: 10,
      currentChain: 7,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            statistics: quizStatistics,
          ),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: QuizFooterInfo(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('7 れんさちゅう'), findsOneWidget);
  });
}
