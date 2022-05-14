import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/data_settings_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';

/// 設定ページです。
class SettingsPage extends ConsumerWidget {
  const SettingsPage({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputType = ref.watch(settingsInputTypeProvider);
    final quizRange = ref.watch(settingsQuizRangeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text('せってい'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('にゅうりょくタイプ'),
            subtitle: Text(_inputTypeTitle(inputType)),
            onTap: () => _onTapInputType(context, ref),
          ),
          ListTile(
            title: const Text('もんだいのはんい'),
            subtitle: Text(quizRange.displayName ?? ''),
            onTap: () => _onTapQuizRange(context, ref),
          ),
          ListTile(
            title: const Text(
              '「きょうのもんだい」のデータをけす',
            ),
            onTap: () => _onTapDeleteDailyData(context, ref),
          ),
          ListTile(
            title: const Text(
              '「いっぱいやる」のデータをけす',
            ),
            onTap: () => _onTapDeleteEndlessData(context, ref),
          ),
        ],
      ),
    );
  }

  /// 入力タイプの変更を行います。
  void _onTapInputType(BuildContext context, WidgetRef ref) {
    final inputType = ref.watch(settingsInputTypeProvider);
    showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('にゅうりょくタイプ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<int>(
                value: inputTypeSwitching,
                groupValue: inputType,
                toggleable: true,
                title: const Text('きりかえタイプ'),
                onChanged: (value) {
                  ref
                      .read(settingsInputTypeProvider.notifier)
                      .updateInputType(inputTypeSwitching);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<int>(
                value: inputTypeAll,
                groupValue: inputType,
                toggleable: true,
                title: const Text('ぜんぶひょうじタイプ'),
                onChanged: (value) {
                  ref
                      .read(settingsInputTypeProvider.notifier)
                      .updateInputType(inputTypeAll);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// 入力タイプのタイトルを取得します。
  String _inputTypeTitle(int inputType) {
    if (inputType == inputTypeSwitching) {
      return 'きりかえタイプ';
    } else if (inputType == inputTypeAll) {
      return 'ぜんぶひょうじタイプ';
    }
    return '';
  }

  /// 問題の範囲の変更を行います。
  void _onTapQuizRange(BuildContext context, WidgetRef ref) {
    final quizRange = ref.watch(settingsQuizRangeProvider);
    showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('もんだいのはんい'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...quizRangeList.map(
                  (e) => RadioListTile<QuizRange>(
                    value: e,
                    groupValue: quizRange,
                    title: Text('${e.displayName}'),
                    toggleable: true,
                    onChanged: (value) {
                      ref
                          .read(settingsQuizRangeProvider.notifier)
                          .updateQuizRange(e);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// きょうのもんだいのデータを削除します。
  void _onTapDeleteDailyData(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          '「きょうのもんだい」のデータをけすと もとにもどせません\nいいですか？',
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('とじる'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(dataSettingsProvider(QuizTypes.daily)).deleteAll();
              Navigator.pop(context);
            },
            child: const Text('データをけす'),
          )
        ],
      ),
    );
  }

  /// いっぱいやるのデータを削除します。
  void _onTapDeleteEndlessData(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          '「いっぱいやる」のデータをけすと もとにもどせません\nいいですか？',
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('とじる'),
          ),
          TextButton(
            onPressed: () async {
              await ref
                  .read(dataSettingsProvider(QuizTypes.endless))
                  .deleteAll();
              Navigator.pop(context);
            },
            child: const Text('データをけす'),
          )
        ],
      ),
    );
  }
}
