import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/monster_picker_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_selection_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_settings_quiz_range_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('QuizSelectionView', (tester) async {
    final monsterPicker = MockMonsterPicker();
    when(monsterPicker.pick()).thenAnswer(
      (_) async => const Monster(
        id: 1,
        name: 'フシギダネ',
      ),
    );

    final fakeSettingsQuizRangeNotifier = FakeSettingsQuizRangeNotifier(xy);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterPickerProvider.overrideWithValue(monsterPicker),
          settingsQuizRangeProvider
              .overrideWith((ref) => fakeSettingsQuizRangeNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(),
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
    final monsterPicker = MockMonsterPicker();
    when(monsterPicker.pick()).thenAnswer(
      (_) async => const Monster(
        id: 1,
        name: 'フシギダネ',
      ),
    );

    final fakeSettingsQuizRangeNotifier = FakeSettingsQuizRangeNotifier(xy);

    final mockQuizPageNotifier = MockQuizPageNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterPickerProvider.overrideWithValue(monsterPicker),
          settingsQuizRangeProvider
              .overrideWith((ref) => fakeSettingsQuizRangeNotifier),
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);

    verify(mockQuizPageNotifier.dismissQuizSelection()).called(1);
  });

  testWidgets('ドロップダウンの選択', (tester) async {
    final monsterPicker = MockMonsterPicker();
    when(monsterPicker.pick()).thenAnswer(
      (_) async => const Monster(
        id: 1,
        name: 'フシギダネ',
      ),
    );

    final fakeSettingsQuizRangeNotifier = FakeSettingsQuizRangeNotifier(xy);
    final mockQuizPageNotifier = MockQuizPageNotifier();
    final mockQuizInfoNotifier = MockQuizInfoNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterPickerProvider.overrideWithValue(monsterPicker),
          settingsQuizRangeProvider
              .overrideWith((ref) => fakeSettingsQuizRangeNotifier),
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizPageNotifier),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(),
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
    final monsterPicker = MockMonsterPicker();
    when(monsterPicker.pick()).thenAnswer(
      (_) async => const Monster(
        id: 1,
        name: 'フシギダネ',
      ),
    );

    final fakeSettingsQuizRangeNotifier = FakeSettingsQuizRangeNotifier(xy);
    final mockQuizPageNotifier = MockQuizPageNotifier();
    final mockQuizInfoNotifier = MockQuizInfoNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          monsterPickerProvider.overrideWithValue(monsterPicker),
          settingsQuizRangeProvider
              .overrideWith((ref) => fakeSettingsQuizRangeNotifier),
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizPageNotifier),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizSelectionView(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('start_button')));

    verify(mockQuizInfoNotifier.startQuiz(any, any)).called(1);
    verify(mockQuizPageNotifier.dismissQuizSelection()).called(1);
  });
}
