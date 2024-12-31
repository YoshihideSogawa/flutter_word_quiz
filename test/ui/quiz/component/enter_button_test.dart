import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';
import 'package:word_quiz/ui/quiz/component/enter_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/fake_monster_list_repository.dart';
import '../../../mock/mock_box_data.dart';
import '../../../mock/monster_test_list.dart';

void main() {
  testWidgets('EnterButton', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: EnterButton(
              enabled: true,
              quizPageInfo: quizPageInfo,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('かくてい'), findsOneWidget);
  });

  testWidgets('EnterButtonのタップ(入力なし)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, quizInfo: quizInfo),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: QuizType(
              quizType: quizType,
              child: EnterButton(
                enabled: true,
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.text('ポケモンの なまえをいれてね'), findsOneWidget);
  });

  testWidgets('EnterButtonのタップ(不明なモンスター)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );
    final wordInput = WordInput(
      wordsList: <InputWords>[
        ['テ', 'ス', 'ト'],
      ].toList(growable: true),
    );

    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            wordInput: wordInput,
          ),
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: QuizType(
              quizType: quizType,
              child: EnterButton(
                enabled: true,
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.text('そのポケモンはいません'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('snack_bar')), findsNothing);
  });

  testWidgets('EnterButtonのタップ(成功)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      quizType: quizType,
      answer: monsterTestList[0],
      playDate: generateDate(),
      maxAnswer: 10,
    );
    final wordInput = WordInput(
      wordsList: <InputWords>[
        ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
      ].toList(growable: true),
    );

    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            wordInput: wordInput,
          ),
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: EnterButton(
                enabled: true,
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    // NOTE: アニメーション待ち
    await tester.pumpAndSettle(const Duration(minutes: 1));

    // TODO(sogawa): ここでなんらかの結果を確認する
  });

  testWidgets('EnterButtonのタップ(成功->失敗)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      quizType: quizType,
      answer: monsterTestList[0],
      playDate: generateDate(),
      maxAnswer: 10,
    );
    final wordInput = WordInput(
      wordsList: <InputWords>[
        ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
      ].toList(growable: true),
    );

    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            wordInput: wordInput,
          ),
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: EnterButton(
                enabled: true,
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    // NOTE: アニメーション待ち
    await tester.pumpAndSettle(const Duration(minutes: 1));

    // TODO(sogawa): ここでなんらかの結果を確認する
  });

  testWidgets('EnterButtonのタップ(Endless -> 成功)', (tester) async {
    const quizType = QuizTypes.endless;
    final quizInfo = QuizInfo(
      quizProcess: QuizProcessType.started,
      quizType: quizType,
      answer: monsterTestList[0],
      playDate: generateDate(),
      maxAnswer: 10,
    );
    final wordInput = WordInput(
      wordsList: <InputWords>[
        ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
      ].toList(growable: true),
    );

    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(
            quizType: quizType,
            quizInfo: quizInfo,
            wordInput: wordInput,
          ),
          monsterListRepositoryProvider
              .overrideWith(FakeMonsterListRepository.new),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: EnterButton(
                enabled: true,
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('enter_button_ink_well')));
    // NOTE: アニメーション待ち
    await tester.pumpAndSettle(const Duration(minutes: 1));

    // TODO(sogawa): ここでなんらかの結果を確認する
  });
}
