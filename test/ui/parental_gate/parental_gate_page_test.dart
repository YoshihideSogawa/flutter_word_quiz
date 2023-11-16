import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/parental_gate_list.dart';
import 'package:word_quiz/model/parental_gate_page_info.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/parental_gate_page_notifier.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/app_property_repository.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';

import '../../mock/fake_parental_gate_page_notifier.dart';
import '../../mock/fake_quiz_info_notifier.dart';
import '../../mock/fake_settings_input_type_notifier.dart';
import '../../mock/fake_word_input_notifier.dart';
import '../../mock/generate_mocks.mocks.dart';
import '../../mock/hive_tester.dart';

void main() {
  setUp(setUpHive);

  tearDown(tearDownHive);

  testWidgets('表示の確認', (tester) async {
    const parentalGatePageInfo = ParentalGatePageInfo(
      maxAnswerNum: 3,
      parentGateDataList: [mizuDeppou, daiMonji, hakaiKosen],
    );

    final notifier = FakeParentalGatePageNotifier(
      parentalGatePageInfo: parentalGatePageInfo,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalGatePageNotifierProvider.overrideWith(() => notifier),
        ],
        child: const MaterialApp(
          home: ParentalGatePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('ねんれいかくにん'), findsOneWidget);
    expect(find.text('みずでっぽうを選んでください(1/3)'), findsOneWidget);
    expect(find.text('水鉄砲'), findsOneWidget);
    expect(find.text('岩雪崩'), findsOneWidget);
    expect(find.text('大文字'), findsOneWidget);
    expect(find.text('火炎放射'), findsOneWidget);
  });

  testWidgets('不正解のタップ', (tester) async {
    await tester.setHiveMockInitialValues(appPropertyBoxName, {
      parentalControlKey: false,
    });

    const parentalGatePageInfo = ParentalGatePageInfo(
      maxAnswerNum: 3,
      parentGateDataList: [mizuDeppou, daiMonji, hakaiKosen],
    );

    final notifier = FakeParentalGatePageNotifier(
      parentalGatePageInfo: parentalGatePageInfo,
    );

    // Splash
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(true);
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalGatePageNotifierProvider.overrideWith(() => notifier),
          // 以下Splash
          appPropertyRepositoryProvider
              .overrideWithValue(mockAppPropertyRepository),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeWordInputNotifier),
          quizInfoProvider(QuizTypes.endless)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ParentalGatePage(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text('button'),
                );
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('岩雪崩'));
    await tester.pumpAndSettle();

    expect(find.textContaining('シェアなどの いちぶきのうを せいげんします'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('正解のタップ', (tester) async {
    const parentalGatePageInfo = ParentalGatePageInfo(
      maxAnswerNum: 3,
      parentGateDataList: [mizuDeppou, daiMonji, hakaiKosen],
    );

    final notifier = FakeParentalGatePageNotifier(
      parentalGatePageInfo: parentalGatePageInfo,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalGatePageNotifierProvider.overrideWith(() => notifier),
        ],
        child: const MaterialApp(
          home: ParentalGatePage(),
        ),
      ),
    );

    await tester.tap(find.text('水鉄砲'));
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('だいもんじ'));
  });

  testWidgets('正解のタップ(全問正解)', (tester) async {
    await tester.setHiveMockInitialValues(appPropertyBoxName, {
      parentalControlKey: false,
    });

    const parentalGatePageInfo = ParentalGatePageInfo(
      maxAnswerNum: 1,
      parentGateDataList: [mizuDeppou, daiMonji, hakaiKosen],
    );

    final notifier = FakeParentalGatePageNotifier(
      parentalGatePageInfo: parentalGatePageInfo,
    );

    // Splash
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(true);
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          parentalGatePageNotifierProvider.overrideWith(() => notifier),
          // 以下Splash
          appPropertyRepositoryProvider
              .overrideWithValue(mockAppPropertyRepository),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeWordInputNotifier),
          quizInfoProvider(QuizTypes.endless)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ParentalGatePage(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text('button'),
                );
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('水鉄砲'));
    await tester.pumpAndSettle();

    expect(find.textContaining('シェアなどの いちぶきのうを かいじょしました'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
