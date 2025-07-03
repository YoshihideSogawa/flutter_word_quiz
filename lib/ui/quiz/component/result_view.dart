import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_properties.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/provider/statistics_notifier.dart';
import 'package:word_quiz/ui/quiz/component/quit_quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/share_button.dart';
import 'package:word_quiz/ui/quiz/component/tweet_button.dart';

/// 結果画面を表示します。（いっぱいやるモードのみ）
class ResultView extends ConsumerWidget {
  const ResultView({super.key, required this.quizPageInfo});

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizInfo = ref.watch(quizInfoNotifierProvider(quizType)).valueOrNull;
    final statistics = ref.watch(statisticsNotifierProvider(quizType));
    return QuizDialog(
      onTap: () {
        quizPageInfo.value = quizPageInfo.value.copyWith(showResult: false);
      },
      child: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
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
                  'いっぱいやる',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const _ResultText(),
                const Divider(),
                const _ResultDetail(),
                const Divider(),
                if (quizInfo?.quizProcess != QuizProcessType.success &&
                    statistics.hasValue)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TweetButton(
                        tweetText: shareText(quizInfo, statistics.value!),
                      ),
                      const SizedBox(width: 12),
                      ShareButton(
                        shareText: shareText(quizInfo, statistics.value!),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                if (quizInfo?.quizProcess == QuizProcessType.success)
                  const Text(
                    'おわる をえらぶと れんさ がとまります',
                    style: TextStyle(fontSize: 10.5),
                  ),
                _ActionButtons(quizPageInfo: quizPageInfo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 結果を表すテキストです。
class _ResultText extends ConsumerWidget {
  const _ResultText(); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    return Column(
      children: [
        Text(_subTitle(ref, quizType), style: const TextStyle(fontSize: 10.5)),
        _buildChainText(ref, quizType),
      ],
    );
  }

  /// サブタイトルを取得します。
  String _subTitle(WidgetRef ref, QuizTypes quizType) {
    final quizInfo = ref.watch(quizInfoNotifierProvider(quizType)).valueOrNull;
    if (quizInfo?.quizProcess == QuizProcessType.success) {
      return 'れんさちゅう';
    }

    if (quizInfo?.quizProcess == QuizProcessType.failure ||
        quizInfo?.quizProcess == QuizProcessType.quit) {
      return 'けっか';
    }

    return '';
  }

  /// 連鎖テキストを構築します。
  Widget _buildChainText(WidgetRef ref, QuizTypes quizType) {
    final quizInfo = ref.watch(quizInfoNotifierProvider(quizType)).valueOrNull;
    final statistics = ref.watch(statisticsNotifierProvider(quizType));
    if (!statistics.hasValue) {
      return const SizedBox.shrink();
    }

    final chainNum = quizInfo?.quizProcess == QuizProcessType.success
        ? statistics.value!.currentChain
        : statistics.value!.lastChain;
    return Text(
      '🎉 $chainNum れんさ 🎉',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}

/// 結果詳細です。
class _ResultDetail extends ConsumerWidget {
  const _ResultDetail(); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizInfo = ref.watch(quizInfoNotifierProvider(quizType)).valueOrNull;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('しゅつだいはんい', style: TextStyle(fontSize: 10.5)),
        const SizedBox(height: 4),
        Text('${quizInfo?.quizRange?.displayName ?? ''} まで'),
        const SizedBox(height: 8),
        const Text('あいことば', style: TextStyle(fontSize: 10.5)),
        const SizedBox(height: 4),
        Text(quizInfo?.seedText ?? ''),
      ],
    );
  }
}

/// シェアテキストを生成します。
@visibleForTesting
String shareText(QuizInfo? info, QuizStatistics statistics) {
  // シェアテキストの構築
  final buffer = StringBuffer()
    ..write('ワードクイズ いっぱいやるモード\n\n')
    ..write('🎉 ${statistics.lastChain} れんさ 🎉\n')
    ..write('もんだいのはんい：${info?.quizRange?.displayName ?? '???'}\n')
    ..write('あいことば：${info?.seedText ?? '???'}\n')
    ..write('で おなじもんだいにちょうせんできるよ\n\n')
    ..write('$appStoreLink\n$appHashTag');
  return buffer.toString();
}

/// 下部のボタンです。
class _ActionButtons extends ConsumerWidget {
  const _ActionButtons({required this.quizPageInfo});

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizInfo = ref.watch(quizInfoNotifierProvider(quizType)).valueOrNull;

    // 成功時はつぎに進むボタンを用意する
    if (quizInfo?.quizProcess == QuizProcessType.success) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              final result = await showQuitQuizDialog(
                context: context,
                label: 'おわりにしますか？',
              );
              if (result) {
                await ref
                    .read(quizInfoNotifierProvider(quizType).notifier)
                    .quitQuiz();
                quizPageInfo.value = quizPageInfo.value.copyWith(
                  showResult: true,
                );
              }
            },
            child: const Text('おわる'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              ref.read(quizInfoNotifierProvider(quizType).notifier).nextQuiz();
              quizPageInfo.value = quizPageInfo.value.copyWith(
                showResult: false,
              );
            },
            child: const Text('つぎへ'),
          ),
        ],
      );
    }

    return TextButton(
      onPressed: () {
        quizPageInfo.value = quizPageInfo.value.copyWith(showResult: false);
      },
      child: const Text('とじる'),
    );
  }
}
