import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 問題のフッター部分の情報
class QuizFooterInfo extends HookConsumerWidget {
  const QuizFooterInfo({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    final quizInfo = ref.read(quizInfoProvider(quizType)).value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _buildDailyLabel(quizType),
          _buildChainLabel(ref, quizType),
          const Spacer(),
          _decoratedContainer(quizInfo?.quizRange?.displayName),
        ],
      ),
    );
  }

  /// きょうのもんだいのラベルを構築します。
  Widget _buildDailyLabel(QuizTypes quizType) {
    if (quizType != QuizTypes.daily) {
      return const SizedBox.shrink();
    }

    final formatMMdd = DateFormat('MM/dd');
    final dateLabel = formatMMdd.format(DateTime.now());
    return _decoratedContainer('$dateLabel のもんだい');
  }

  /// 連鎖数の表示を構築します。
  Widget _buildChainLabel(WidgetRef ref, QuizTypes quizType) {
    if (quizType != QuizTypes.endless) {
      return const SizedBox.shrink();
    }

    final quizInfo = ref.read(quizInfoProvider(quizType)).value;
    if (quizInfo?.quizProcess == QuizProcessType.none) {
      return const SizedBox.shrink();
    }

    final statistics = ref.read(statisticsProvider(quizType));
    final String chainLabel;
    if (quizInfo?.quizProcess == QuizProcessType.quit ||
        quizInfo?.quizProcess == QuizProcessType.failure) {
      chainLabel = '${statistics.lastChain} れんさ';
    } else {
      chainLabel = '${statistics.currentChain} れんさちゅう';
    }
    return _decoratedContainer(chainLabel);
  }

  /// 情報表示エリアを構築します。
  Widget _decoratedContainer(String? text) {
    if (text == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(useContext()).brightness == Brightness.dark
              ? Colors.white24
              : Colors.black26,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10.5,
        ),
      ),
    );
  }
}
