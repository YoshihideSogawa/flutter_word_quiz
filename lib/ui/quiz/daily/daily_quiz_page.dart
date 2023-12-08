import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';

/// きょうのもんだいの画面です。
class DailyQuizPage extends HookConsumerWidget {
  const DailyQuizPage({
    super.key,
  }); // coverage:ignore-line

  /// [QuizTypes]
  static const _quizType = QuizTypes.daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizInfo = ref.watch(quizInfoProvider(_quizType));
    final quizPageInfo = useState(const QuizPageInfo());

    // 初回読み込み時の処理
    ref.listen(quizInfoProvider(_quizType), (previous, next) {
      // 初回読み込み時
      if (previous?.isLoading == true && next.hasValue) {
        // きょうのもんだいが成功か失敗していたら統計画面を表示
        final quizProcess = next.valueOrNull?.quizProcess;
        if (quizProcess == QuizProcessType.success ||
            quizProcess == QuizProcessType.failure) {
          quizPageInfo.value = const QuizPageInfo(
            showStatistics: true,
          );
        }
      }

      // 読み込み済み
      if (previous?.hasValue == true && next.hasValue) {
        // 新着問題への切り替え通知
        if (previous?.valueOrNull?.playDate != next.valueOrNull?.playDate) {
          quizPageInfo.value = const QuizPageInfo(
            showQuizChanged: true,
          );
        }
      }
    });

    return quizInfo.when(
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text(
            'もんだいが おこりました\nアプリを さいきどう してください',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (_) => QuizType(
        quizType: _quizType,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: dailyQuizColor,
            centerTitle: true,
            title: const Text('きょうのもんだい'),
            actions: [
              RefreshQuizButton(quizPageInfo: quizPageInfo),
              StatisticsButton(quizPageInfo: quizPageInfo),
            ],
          ),
          drawer: const QuizDrawer(),
          body: WordQuizLayout(quizPageInfo: quizPageInfo),
        ),
      ),
    );
  }
}
