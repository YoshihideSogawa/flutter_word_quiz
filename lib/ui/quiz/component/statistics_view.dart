import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_properties.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/remaining_time_provider.dart';
import 'package:word_quiz/provider/statistics_notifier.dart';
import 'package:word_quiz/provider/word_input_notifier.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/share_button.dart';
import 'package:word_quiz/ui/quiz/component/tweet_button.dart';

/// 統計とシェアの表示です。
class StatisticsView extends ConsumerWidget {
  const StatisticsView({super.key}); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizInfo = ref.watch(quizInfoProvider(quizType)).value;
    final wordInput = ref.watch(wordInputNotifierProvider(quizType));
    final statistics = ref.watch(statisticsNotifierProvider(quizType));

    return QuizDialog(
      onTap: () async {
        await close(ref, quizType);
      },
      child: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  _title(quizType),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                if (quizType == QuizTypes.daily) const _ResultText(),
                const Divider(),
                const _ResultDetail(),
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (quizType == QuizTypes.daily) _buildClockLayout(),
                    if (quizType == QuizTypes.endless)
                      _buildSecretText(quizInfo),
                    if (statistics.hasValue && wordInput.hasValue)
                      Column(
                        children: [
                          TweetButton(
                            tweetText: shareText(
                              quizInfo,
                              wordInput.value!,
                              statistics.value!,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ShareButton(
                            shareText: shareText(
                              quizInfo,
                              wordInput.value!,
                              statistics.value!,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    await close(ref, quizType);
                  },
                  child: const Text('とじる'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// タイトルを取得します。
  String _title(QuizTypes quizType) {
    switch (quizType) {
      case QuizTypes.daily:
        return 'きょうの もんだい';
      case QuizTypes.endless:
        return 'いっぱいやる モード';
    }
  }

  /// あいことばを構築します。
  Widget _buildSecretText(QuizInfo? quizInfo) {
    return Column(
      children: [
        const Text(
          'さいごにあそんだ あいことば',
          style: TextStyle(fontSize: 10.5),
        ),
        const SizedBox(height: 4),
        Text(
          quizInfo?.seedText ?? '-',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// 時刻のレイアウトを構築します。
  Widget _buildClockLayout() {
    return const Column(
      children: [
        Text(
          'もんだいが かわるまで',
          style: TextStyle(fontSize: 10.5),
        ),
        SizedBox(height: 4),
        _ClockText(),
      ],
    );
  }

  /// この画面を閉じます。(問題の更新があれば更新します。)
  Future<void> close(WidgetRef ref, QuizTypes quizType) async {
    await ref.read(quizInfoProvider(quizType).notifier).refreshDailyQuiz();
    ref.read(quizPageProvider(quizType).notifier).dismissStatistics();
  }
}

/// 結果を表すテキストです。
class _ResultText extends ConsumerWidget {
  const _ResultText(); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizProcess =
        ref.watch(quizInfoProvider(quizType)).value?.quizProcess;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(quizProcess),
        const SizedBox(width: 4),
        Text(
          _buildLabel(quizProcess),
          key: const Key('statistics_label'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(width: 4),
        _buildIcon(quizProcess),
      ],
    );
  }

  /// ボールアイコンを構築します。
  Widget _buildIcon(QuizProcessType? quizProcess) {
    final Color color;
    switch (quizProcess) {
      case QuizProcessType.started:
        color = Colors.redAccent;
      case QuizProcessType.success:
        color = Colors.redAccent;
      case QuizProcessType.failure:
        color = Colors.grey;
      case QuizProcessType.quit:
        color = Colors.redAccent;
      case QuizProcessType.none:
        color = Colors.grey;
      case null:
        color = Colors.redAccent;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Icon(
        Icons.catching_pokemon,
        color: color,
        size: 18,
      ),
    );
  }

  /// ラベルを生成します。
  String _buildLabel(QuizProcessType? quizProcess) {
    switch (quizProcess) {
      case QuizProcessType.started:
        return 'ちょうせんちゅう';
      case QuizProcessType.success:
        return '  クリア！';
      case QuizProcessType.failure:
        return 'しっぱい...';
      case QuizProcessType.none:
        return '[はじめから] をおしてね';
      case QuizProcessType.quit:
      case null:
        return '';
    }
  }
}

/// 結果詳細です。
class _ResultDetail extends ConsumerWidget {
  const _ResultDetail(); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final statistics = ref.watch(statisticsNotifierProvider(quizType));
    if (!statistics.hasValue) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDetailContent('プレイ\nかいすう', statistics.value!.playCount),
        _buildDetailContent('クリア\nかいすう', statistics.value!.clearCount),
        _buildDetailContent('れんさ\nかいすう', statistics.value!.currentChain),
        _buildDetailContent('さいだい\nれんさ', statistics.value!.maxChain),
      ],
    );
  }

  /// 詳細内容を構築します。
  Widget _buildDetailContent(String title, int num) {
    return Column(
      children: [
        Text(
          '$num',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 9.5,
          ),
        ),
      ],
    );
  }
}

/// 問題が変わるまでの時間表示を行います。
class _ClockText extends ConsumerWidget {
  const _ClockText(); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingTime = ref.watch(remainingTimeProvider);
    return Text(
      remainingTime,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// シェア用のテキストを生成します。
@visibleForTesting
String shareText(
  QuizInfo? quizInfo,
  WordInput wordInput,
  QuizStatistics statistics,
) {
  switch (quizInfo?.quizType) {
    case QuizTypes.daily:
    case null:
      return _shareTextDaily(quizInfo, wordInput);
    case QuizTypes.endless:
      return _shareTextEndless(statistics);
  }
}

/// きょうのもんだいのシェアテキストを生成します。
String _shareTextDaily(QuizInfo? quizInfo, WordInput wordInput) {
  // シェアテキストの構築
  final buffer = StringBuffer()
    ..write(_prefixTextDaily(quizInfo, wordInput.inputIndex))
    ..write('\n');

  // ゲームの結果が出ている時のみワードを表示
  if (quizInfo?.quizProcess == QuizProcessType.success ||
      quizInfo?.quizProcess == QuizProcessType.failure) {
    final resultText = _resultsText(wordInput);
    for (var i = 0; i < min(5, resultText.length); i++) {
      buffer.write(resultText[i]);
      if (i + 5 < resultText.length) {
        buffer.write('  ${resultText[i + 5]}');
      }
      buffer.write('\n');
    }
    buffer.write('\n');
  }
  buffer.write('$appStoreLink\n$appHashTag');
  return buffer.toString();
}

/// 先頭につくテキストです。
String _prefixTextDaily(QuizInfo? quizInfo, int wordInputIndex) {
  switch (quizInfo?.quizProcess) {
    case QuizProcessType.success:
    case QuizProcessType.quit:
      return 'ワードクイズ $wordInputIndex/${quizInfo?.maxAnswer}'
          ' (${parseDateText(quizInfo?.playDate ?? 0)})\n';
    case QuizProcessType.failure:
      return 'ワードクイズ X/${quizInfo?.maxAnswer}'
          ' (${parseDateText(quizInfo?.playDate ?? 0)})\n';
    case QuizProcessType.started:
    case QuizProcessType.none:
    case null:
      return 'モンスターの なまえあてゲーム であそぼう！\n';
  }
}

/// 結果のテキストを生成します。
List<String> _resultsText(WordInput wordInput) {
  // ブロック文字に変換
  final resultText = <String>[];
  final resultsList = wordInput.wordsResultList;
  for (var i = 0; i < resultsList.length; i++) {
    final resultList = resultsList[i] ?? [];
    resultText.add('');
    for (var j = 0; j < 5; j++) {
      // 文字不足分
      if (j >= resultList.length) {
        resultText[i] += '⬜';
        continue;
      }

      switch (resultList[j]) {
        case WordNameState.none:
          resultText[i] += '⬜';
        case WordNameState.hit:
          resultText[i] += '🟨';
        case WordNameState.match:
          resultText[i] += '🟩';
        case WordNameState.notMatch:
          resultText[i] += '⬛';
      }
    }
  }
  return resultText;
}

/// いっぱいやるモードのシェアテキストを生成します。
String _shareTextEndless(QuizStatistics statistics) {
  final buffer = StringBuffer()
    ..write('ワードクイズ いっぱいやるモード\n\n')
    ..write('プレイかいすう：${statistics.playCount}\n')
    ..write('クリアかいすう：${statistics.clearCount}\n')
    ..write('いまのれんさ　：${statistics.currentChain}\n')
    ..write('さいだいれんさ：${statistics.maxChain}\n\n')
    ..write('$appStoreLink\n$appHashTag');
  return buffer.toString();
}
