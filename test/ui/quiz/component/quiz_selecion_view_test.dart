import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';
import 'package:word_quiz/ui/quiz/component/quiz_selection_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_monster_list_repository.dart';
import '../../../mock/generate_mocks.mocks.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('QuizSelectionView', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(quizRange: xy),
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('いっぱいやる'), findsOneWidget);
    expect(find.text('なんもん れんぞくで せいかい できるかな？'), findsOneWidget);
    expect(find.text('もんだいのはんい'), findsOneWidget);
    expect(find.text('X・Y'), findsOneWidget);
    expect(find.text('あいことば'), findsOneWidget);
    expect(find.text('フシギダネ'), findsOneWidget);
    expect(find.text('スタート'), findsOneWidget);
  });

  testWidgets('外側の領域のタップ(キャンセル)', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
          settingsOverride(quizRange: xy),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);

    expect(quizPageInfo.value.showQuizSelection, false);
  });

  testWidgets('ドロップダウンの選択', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final mockQuizInfoNotifier = MockQuizInfoNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
          settingsOverride(quizRange: xy),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // ドロップダウンの表示と選択
    await tester.tap(find.text(xy.displayName!));
    await tester.pumpAndSettle();
    await tester.tap(find.text(diamondPearl.displayName!).last);
    await tester.pumpAndSettle();

    expect(find.text(diamondPearl.displayName!), findsOneWidget);
  });

  testWidgets('スタートのタップ', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final mockQuizInfoNotifier = MockQuizInfoNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
          settingsOverride(quizRange: xy),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('start_button')));

    verify(mockQuizInfoNotifier.startQuiz(any, any)).called(1);
    expect(quizPageInfo.value.showQuizSelection, false);
  });
}
