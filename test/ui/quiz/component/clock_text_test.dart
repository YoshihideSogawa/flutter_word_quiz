import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/ui/quiz/component/clock_text.dart';

void main() {
  testWidgets('ClockText(new RemainingTime)', (tester) async {
    fakeAsync((fakeClock) {
      tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: ClockText(),
          ),
        ),
      );

      // 初期時間
      fakeClock.flushMicrotasks();
      final textBefore =
          tester.widget<Text>(find.byKey(const Key('clock_text'))).data;

      // 10秒経過
      fakeClock.elapse(const Duration(seconds: 10));

      tester.pump();
      fakeClock.flushMicrotasks();

      final textAfter =
          tester.widget<Text>(find.byKey(const Key('clock_text'))).data;
      expect(textBefore != textAfter, isTrue);
    });
  });
}
