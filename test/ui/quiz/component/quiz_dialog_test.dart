import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';

void main() {
  testWidgets('QuizDialog', (tester) async {
    var onTapCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizDialog(
            onTap: () {
              onTapCalled = true;
            },
            child: const Text('test'),
          ),
        ),
      ),
    );

    expect(find.text('test'), findsOneWidget);

    await tester.tapAt(Offset.zero);
    expect(onTapCalled, isTrue);
  });

  testWidgets('QuizDialogが閉じるのをガード', (tester) async {
    var onTapCalled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuizDialog(
            onTap: () {
              onTapCalled = true;
            },
            child: const Text('test'),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('quiz_dialog_content_gesture')));
    expect(onTapCalled, isFalse);
  });
}
