import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';

/// いっぱいやる画面のページです。
class EndlessQuizPage extends HookConsumerWidget {
  const EndlessQuizPage({
    super.key,
  });

  /// [QuizTypes]
  static const _quizType = QuizTypes.endless;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizPageInfo = useState(const QuizPageInfo());
    final quizInfoNotifier = ref.watch(quizInfoNotifierProvider(_quizType));

    // 初回読み込み時の処理
    ref.listen(quizInfoNotifierProvider(_quizType), (previous, next) {
      // 既に読み込み済み or データがない場合は何もしない
      if (previous?.isLoading == false || !next.hasValue) {
        return;
      }

      // // 答えが決まっていない場合(初回起動時、データ削除時)
      if (next.valueOrNull?.answer == null) {
        // いっぱいやるは自動的に開始する
        quizPageInfo.value = const QuizPageInfo(
          showQuizSelection: true,
        );
      }
    });

    return quizInfoNotifier.maybeWhen(
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text(
            'もんだいが おこりました\nアプリを さいきどう してください',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      orElse: () => QuizType(
        quizType: _quizType,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: endlessQuizColor,
            centerTitle: true,
            title: const Text('いっぱいやる'),
            actions: [
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
