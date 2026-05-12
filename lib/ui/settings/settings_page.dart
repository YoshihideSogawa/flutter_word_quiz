import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/quiz/clear_quiz_data_repository.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';
import 'package:word_quiz/repository/settings/quiz_range_repository.dart';
import 'package:word_quiz/ui/settings/component/data_delete_confirm_dialog.dart';

/// 設定ページです。
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key}); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputTypeNotifier = ref.watch(inputTypeRepositoryProvider);
    final quizRangeNotifier = ref.watch(quizRangeRepositoryProvider);
    final inputType = inputTypeNotifier.valueOrNull;
    final quizRange = quizRangeNotifier.valueOrNull;
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
            onTap: () => _onTapInputType(context, ref, inputType),
          ),
          ListTile(
            title: const Text('もんだいのはんい'),
            subtitle: Text(quizRange?.displayName ?? ''),
            onTap: () => _onTapQuizRange(context, ref, quizRange),
          ),
          ListTile(
            title: const Text('「きょうのもんだい」のデータをけす'),
            onTap: () => _onTapDeleteDailyData(context, ref),
          ),
          ListTile(
            title: const Text('「いっぱいやる」のデータをけす'),
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
          content: RadioGroup<InputTypes>(
            groupValue: inputTypes,
            onChanged: (value) async {
              if (value == null) {
                if (context.mounted) {
                  Navigator.pop(context);
                }
                return;
              }

              await ref
                  .read(inputTypeRepositoryProvider.notifier)
                  .updateInputType(value);
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<InputTypes>(
                  value: InputTypes.switching,
                  toggleable: true,
                  title: Text('きりかえタイプ'),
                ),
                RadioListTile<InputTypes>(
                  value: InputTypes.all,
                  toggleable: true,
                  title: Text('ぜんぶひょうじタイプ'),
                ),
              ],
            ),
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
  void _onTapQuizRange(
    BuildContext context,
    WidgetRef ref,
    QuizRange? quizRange,
  ) {
    showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('もんだいのはんい'),
          content: RadioGroup<QuizRange>(
            groupValue: quizRange,
            onChanged: (value) {
              if (value == null) {
                if (context.mounted) {
                  Navigator.pop(context);
                }
                return;
              }

              ref
                  .read(quizRangeRepositoryProvider.notifier)
                  .updateQuizRange(value);
              Navigator.pop(context);
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...quizRangeList.map(
                    (e) => RadioListTile<QuizRange>(
                      value: e,
                      toggleable: true,
                      title: Text('${e.displayName}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// きょうのもんだいのデータを削除します。
  Future<void> _onTapDeleteDailyData(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final result = await showDataDeleteDialog(
      context,
      '「きょうのもんだい」のデータをけすと もとにもどせません\nいいですか？',
    );

    if (result != true) {
      return;
    }

    // データの削除
    await ref.read(clearQuizDataProvider(QuizTypes.daily).future);
  }

  /// いっぱいやるのデータを削除します。
  Future<void> _onTapDeleteEndlessData(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final result = await showDataDeleteDialog(
      context,
      '「いっぱいやる」のデータをけすと もとにもどせません\nいいですか？',
    );

    if (result != true) {
      return;
    }

    // データの削除
    await ref.read(clearQuizDataProvider(QuizTypes.endless).future);
  }
}
