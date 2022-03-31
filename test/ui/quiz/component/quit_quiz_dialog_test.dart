import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/ui/quiz/component/quit_quiz_dialog.dart';

void main() {
  testWidgets('QuitQuizDialog', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showQuitQuizDialog(context: context, label: 'test');
                },
                child: const Text('button'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('quit_quiz_dialog')), findsOneWidget);
  });

  testWidgets('QuitQuizDialogの「はい」をタップ', (tester) async {
    bool? result;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result =
                      await showQuitQuizDialog(context: context, label: 'test');
                },
                child: const Text('button'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle();

    expect(result, isTrue);
    expect(find.byKey(const Key('quit_quiz_dialog')), findsNothing);
  });

  testWidgets('QuitQuizDialogの「いいえ」をタップ', (tester) async {
    bool? result;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result =
                      await showQuitQuizDialog(context: context, label: 'test');
                },
                child: const Text('button'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('いいえ'));
    await tester.pumpAndSettle();

    expect(result, isFalse);
    expect(find.byKey(const Key('quit_quiz_dialog')), findsNothing);
  });
}
