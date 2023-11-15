import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';

void main() {
  testWidgets('NameText(none)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: NameText(
              width: 100,
              height: 100,
              nameState: WordNameState.none,
              text: 'ア',
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    final context = tester.element(find.byType(Scaffold));
    // 枠と中の色
    final container =
        tester.widget<Container>(find.byKey(const Key('name_text_container')));
    final borderColor =
        ((container.decoration as BoxDecoration?)?.border as Border?)
            ?.left
            .color;
    final boxColor = (container.decoration as BoxDecoration?)?.color;
    expect(borderColor, Colors.black26);
    expect(boxColor, Colors.transparent);

    // 文字の色
    final text = tester.widget<Text>(find.byKey(const Key('name_character')));
    expect(text.style?.color, Theme.of(context).textTheme.subtitle1?.color);
  });

  testWidgets('NameText(hit)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: NameText(
              width: 100,
              height: 100,
              nameState: WordNameState.hit,
              text: 'ア',
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 枠と中の色
    final container =
        tester.widget<Container>(find.byKey(const Key('name_text_container')));
    final borderColor =
        ((container.decoration as BoxDecoration?)?.border as Border?)
            ?.left
            .color;
    final boxColor = (container.decoration as BoxDecoration?)?.color;
    expect(borderColor, hitColor);
    expect(boxColor, hitColor);

    // 文字の色
    final text = tester.widget<Text>(find.byKey(const Key('name_character')));
    expect(text.style?.color, Colors.white);
  });

  testWidgets('NameText(match)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: NameText(
              width: 100,
              height: 100,
              nameState: WordNameState.match,
              text: 'ア',
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 枠と中の色
    final container =
        tester.widget<Container>(find.byKey(const Key('name_text_container')));
    final borderColor =
        ((container.decoration as BoxDecoration?)?.border as Border?)
            ?.left
            .color;
    final boxColor = (container.decoration as BoxDecoration?)?.color;
    expect(borderColor, matchColor);
    expect(boxColor, matchColor);

    // 文字の色
    final text = tester.widget<Text>(find.byKey(const Key('name_character')));
    expect(text.style?.color, Colors.white);
  });

  testWidgets('NameText(match)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: NameText(
              width: 100,
              height: 100,
              nameState: WordNameState.notMatch,
              text: 'ア',
            ),
          ),
        ),
      ),
    );

    expect(find.text('ア'), findsOneWidget);

    // 枠と中の色
    final container =
        tester.widget<Container>(find.byKey(const Key('name_text_container')));
    final borderColor =
        ((container.decoration as BoxDecoration?)?.border as Border?)
            ?.left
            .color;
    final boxColor = (container.decoration as BoxDecoration?)?.color;
    expect(borderColor, notMatchColor);
    expect(boxColor, notMatchColor);

    // 文字の色
    final text = tester.widget<Text>(find.byKey(const Key('name_character')));
    expect(text.style?.color, Colors.white);
  });
}
