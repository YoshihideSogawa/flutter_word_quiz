import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/share_button.dart';

import '../../../mock/share_plus_tester.dart';

void main() {
  late FakeSharePlus sharePlus;

  setUp(() {
    sharePlus = setUpSharePlus();
  });

  testWidgets('ShareButton', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      const MaterialApp(
        home: QuizType(
          quizType: quizType,
          child: Scaffold(
            body: ShareButton(shareText: 'text'),
          ),
        ),
      ),
    );

    expect(find.text('シェア'), findsOneWidget);
    expect(find.byIcon(Icons.share), findsOneWidget);
  });

  testWidgets('ShareButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      const MaterialApp(
        home: QuizType(
          quizType: quizType,
          child: Scaffold(
            body: ShareButton(shareText: 'text'),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('share_button')));
    await tester.pumpAndSettle();
    expect(sharePlus.shareCalled, isTrue);
  });
}
