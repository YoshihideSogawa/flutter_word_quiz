import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/routing/routes.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';

import '../../../mock/go_router_tester.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  late FakeGoRouter router;

  setUp(() {
    router = FakeGoRouter();
  });

  testWidgets('QuizDrawer', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizDrawer(),
        ),
      ),
    );

    expect(find.text('ワードクイズ'), findsOneWidget);
    expect(find.text('あそびかた'), findsOneWidget);
    expect(find.text('せってい'), findsOneWidget);
    expect(find.text('このアプリについて'), findsOneWidget);
  });

  testWidgets('あそびかたのタップ', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(
            parentalControl: false,
            alreadyLaunched: false,
          ),
        ],
        child: InheritedGoRouter(
          goRouter: router,
          child: const MaterialApp(
            home: Scaffold(
              body: QuizDrawer(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('あそびかた'));
    await tester.pumpAndSettle();
    expect(router.lastLocation, Routes.howToPlay);
  });

  testWidgets('せっていのタップ', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(
            inputType: InputTypes.switching,
            quizRange: diamondPearl,
          ),
        ],
        child: InheritedGoRouter(
          goRouter: router,
          child: const MaterialApp(
            home: Scaffold(
              body: QuizDrawer(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('せってい'));
    await tester.pumpAndSettle();
    expect(router.lastLocation, Routes.settings);
  });

  testWidgets('このアプリについてのタップ', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizDrawer(),
        ),
      ),
    );

    await tester.tap(find.text('このアプリについて'));
    await tester.pumpAndSettle();
    expect(find.byType(AboutDialog), findsOneWidget);
  });
}
