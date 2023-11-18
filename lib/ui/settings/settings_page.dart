import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/data_settings_provider.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';

/// 設定ページです。
class SettingsPage extends ConsumerWidget {
  const SettingsPage({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputType = ref.watch(inputTypeRepositoryProvider);
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
            subtitle: Text(_inputTypeTitle(inputType.valueOrNull)),
            onTap: () => _onTapInputType(context, ref, inputType.valueOrNull),
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
  void _onTapInputType(
    BuildContext context,
    WidgetRef ref,
    InputTypes? inputTypes,
  ) {
    showDialog<InputTypes>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('にゅうりょくタイプ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<InputTypes>(
                value: InputTypes.switching,
                groupValue: inputTypes,
                toggleable: true,
                title: const Text('きりかえタイプ'),
                onChanged: (value) async {
                  await ref
                      .read(inputTypeRepositoryProvider.notifier)
                      .updateInputType(InputTypes.switching);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              RadioListTile<InputTypes>(
                value: InputTypes.all,
                groupValue: inputTypes,
                toggleable: true,
                title: const Text('ぜんぶひょうじタイプ'),
                onChanged: (value) async {
                  await ref
                      .read(inputTypeRepositoryProvider.notifier)
                      .updateInputType(InputTypes.all);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// 入力タイプのタイトルを取得します。
  String _inputTypeTitle(InputTypes? inputType) {
    return switch (inputType) {
      InputTypes.switching => 'きりかえタイプ',
      InputTypes.all => 'ぜんぶひょうじタイプ',
      _ => '',
    };
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
                ),
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
              final navigator = Navigator.of(context);
              await ref.read(dataSettingsProvider(QuizTypes.daily)).deleteAll();
              if (!navigator.mounted) {
                return;
              }

              navigator.pop();
            },
            child: const Text('データをけす'),
          ),
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
              final navigator = Navigator.of(context);
              await ref
                  .read(dataSettingsProvider(QuizTypes.endless))
                  .deleteAll();
              if (!navigator.mounted) {
                return;
              }

              navigator.pop();
            },
            child: const Text('データをけす'),
          ),
        ],
      ),
    );
  }
}
