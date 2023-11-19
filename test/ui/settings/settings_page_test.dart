import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/data_settings_provider.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';
import 'package:word_quiz/ui/settings/settings_page.dart';

import '../../mock/generate_mocks.mocks.dart';
import '../../mock/mock_box_data.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
  });

  testWidgets('SettingsPage(きりかえタイプ)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(
            inputType: InputTypes.switching,
            quizRange: blackWhite,
          ),
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('にゅうりょくタイプ'), findsOneWidget);
    expect(find.text('きりかえタイプ'), findsOneWidget);
    expect(find.text('もんだいのはんい'), findsOneWidget);
    expect(find.text('ブラック・ホワイト'), findsOneWidget);
    expect(find.text('「きょうのもんだい」のデータをけす'), findsOneWidget);
    expect(find.text('「いっぱいやる」のデータをけす'), findsOneWidget);
  });

  testWidgets('SettingsPage(ぜんぶひょうじタイプ)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(
            inputType: InputTypes.all,
            quizRange: blackWhite,
          ),
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('にゅうりょくタイプ'), findsOneWidget);
    expect(find.text('ぜんぶひょうじタイプ'), findsOneWidget);
  });

  testWidgets('にゅうりょくタイプのタップ', (tester) async {
    final settings = settingsOverrideAndBox(
      inputType: InputTypes.switching,
      quizRange: blackWhite,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settings.override,
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // ダイアログ表示(1回目)
    await tester.tap(find.text('にゅうりょくタイプ'));
    await tester.pumpAndSettle();

    expect(find.text('にゅうりょくタイプ'), findsWidgets);
    expect(find.text('きりかえタイプ'), findsWidgets);
    expect(find.text('ぜんぶひょうじタイプ'), findsOneWidget);

    // ぜんぶひょうじタイプを選択
    await tester.tap(find.text('ぜんぶひょうじタイプ'));
    await tester.pumpAndSettle();
    expect(settings.box.data[inputTypeKey], InputTypes.all.typeId);

    // ダイアログ表示(2回目)
    await tester.tap(find.text('にゅうりょくタイプ'));
    await tester.pumpAndSettle();

    // きりかえタイプを選択
    await tester.tap(find.text('きりかえタイプ').last);
    await tester.pumpAndSettle();
    expect(settings.box.data[inputTypeKey], InputTypes.switching.typeId);
  });

  testWidgets('もんだいのはんいのタップ', (tester) async {
    final settings = settingsOverrideAndBox(
      inputType: InputTypes.switching,
      quizRange: blackWhite,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settings.override,
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // ダイアログ表示
    await tester.tap(find.text('もんだいのはんい'));
    await tester.pumpAndSettle();

    expect(find.text('もんだいのはんい'), findsWidgets);
    expect(find.text('あか・みどり'), findsOneWidget);
    expect(find.text('きん・ぎん'), findsOneWidget);
    expect(find.text('ルビー・サファイア'), findsOneWidget);
    expect(find.text('ダイヤモンド・パール'), findsOneWidget);
    expect(find.text('ブラック・ホワイト'), findsWidgets);
    expect(find.text('X・Y'), findsOneWidget);
    expect(find.text('サン・ムーン'), findsOneWidget);
    expect(find.text('ソード・シールド'), findsOneWidget);
    expect(find.text('アルセウス'), findsOneWidget);

    // ソード・シールドを選択
    await tester.tap(find.text('ソード・シールド'));
    await tester.pumpAndSettle();

    expect(settings.box.data[quizRangeKey], swordShield.id);
  });

  testWidgets('きょうのもんだいのデータ削除のタップ', (tester) async {
    final mockDataSettings = MockDataSettings();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(
            inputType: InputTypes.switching,
            quizRange: blackWhite,
          ),
          dataSettingsProvider(QuizTypes.daily)
              .overrideWithValue(mockDataSettings),
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // ダイアログ表示
    await tester.tap(find.text('「きょうのもんだい」のデータをけす'));
    await tester.pumpAndSettle();

    const confirmTitle = '「きょうのもんだい」のデータをけすと もとにもどせません'
        '\nいいですか？';
    expect(find.text(confirmTitle), findsOneWidget);

    // キャンセル
    await tester.tap(find.text('とじる'));
    await tester.pumpAndSettle();
    expect(find.text(confirmTitle), findsNothing);

    // ダイアログ表示(2回目)
    await tester.tap(find.text('「きょうのもんだい」のデータをけす'));
    await tester.pumpAndSettle();

    // 削除
    await tester.tap(find.text('データをけす'));
    await tester.pumpAndSettle();
    expect(find.text(confirmTitle), findsNothing);

    verify(mockDataSettings.deleteAll()).called(1);
  });

  testWidgets('いっぱいやるのデータ削除のタップ', (tester) async {
    final mockDataSettings = MockDataSettings();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(
            inputType: InputTypes.switching,
            quizRange: blackWhite,
          ),
          dataSettingsProvider(QuizTypes.endless)
              .overrideWithValue(mockDataSettings),
        ],
        child: const MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // ダイアログ表示
    await tester.tap(find.text('「いっぱいやる」のデータをけす'));
    await tester.pumpAndSettle();

    const confirmTitle = '「いっぱいやる」のデータをけすと もとにもどせません'
        '\nいいですか？';
    expect(find.text(confirmTitle), findsOneWidget);

    // キャンセル
    await tester.tap(find.text('とじる'));
    await tester.pumpAndSettle();
    expect(find.text(confirmTitle), findsNothing);

    // ダイアログ表示(2回目)
    await tester.tap(find.text('「いっぱいやる」のデータをけす'));
    await tester.pumpAndSettle();

    // 削除
    await tester.tap(find.text('データをけす'));
    await tester.pumpAndSettle();
    expect(find.text(confirmTitle), findsNothing);

    verify(mockDataSettings.deleteAll()).called(1);
  });
}
