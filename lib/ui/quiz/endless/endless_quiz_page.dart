import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
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
    final quizInfo = ref.watch(quizInfoProvider(_quizType));
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
