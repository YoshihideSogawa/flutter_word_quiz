import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/routing/router.dart';
import 'package:word_quiz/routing/routes.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/parental_gate/parental_gate_page.dart';
import 'package:word_quiz/ui/settings/settings_page.dart';

import '../mock/mock_box_data.dart';

void main() {
  testWidgets('Routing', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(),
          appPropertyOverride(
            parentalControl: false,
            alreadyLaunched: false,
          ),
          quizOverride(quizType: QuizTypes.daily),
          quizOverride(quizType: QuizTypes.endless),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          builder: (context, child) {
            return Container(child: child);
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    // ParentalGatePage
    var context = tester.element(find.byType(Scaffold));
    if (!context.mounted) {
      fail('No Context');
    }
    context.go(Routes.parentalGate);
    await tester.pumpAndSettle();
    expect(find.byType(ParentalGatePage), findsOneWidget);

    // HowToPlayPage
    context = tester.element(find.byType(Scaffold));
    if (!context.mounted) {
      fail('No Context');
    }
    context.go(Routes.howToPlay);
    await tester.pumpAndSettle();
    expect(find.byType(HowToPlayPage), findsOneWidget);

    // SettingsPage
    context = tester.element(find.byType(Scaffold));
    if (!context.mounted) {
      fail('No Context');
    }
    context.go(Routes.settings);
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);
  });
}
