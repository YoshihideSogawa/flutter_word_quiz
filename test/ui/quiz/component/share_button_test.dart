import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/share_button.dart';

import '../../../mock/mock_box_data.dart';
import '../../../mock/mock_hive_box.dart';
import '../../../mock/share_plus_tester.dart';

void main() {
  late FakeSharePlus sharePlus;

  setUp(() {
    sharePlus = setUpSharePlus();
    AppPlatform.overridePlatForm = Platforms.iOS;
  });

  tearDown(() => AppPlatform.overridePlatForm = null);

  testWidgets('ShareButton', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(parentalControl: false),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ShareButton(shareText: 'text'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('シェア'), findsOneWidget);
    expect(find.byIcon(Icons.share), findsOneWidget);
  });

  testWidgets('ShareButton(ペアレンタルコントロール中のタップ)', (tester) async {
    const quizType = QuizTypes.daily;
    final box = MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: true,
      },
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          hiveBoxProvider(appPropertyBoxName).overrideWith((ref) => box),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ShareButton(shareText: 'text'),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('シェア'));
    await tester.pumpAndSettle();

    expect(find.byType(ParentalGatePage), findsOneWidget);
  });

  testWidgets('ShareButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    final box = MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: false,
      },
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          hiveBoxProvider(appPropertyBoxName).overrideWith((ref) => box),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ShareButton(shareText: 'text'),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('share_button')));
    await tester.pumpAndSettle();
    expect(sharePlus.shareCalled, isTrue);
  });
}
