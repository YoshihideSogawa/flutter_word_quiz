import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';
import 'package:word_quiz/ui/quiz/component/answer_button.dart';
import 'package:word_quiz/ui/quiz/component/answer_view.dart';
import 'package:word_quiz/ui/quiz/component/delete_button.dart';
import 'package:word_quiz/ui/quiz/component/enter_button.dart';
import 'package:word_quiz/ui/quiz/component/give_up_button.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_switch_button.dart';
import 'package:word_quiz/ui/quiz/component/next_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_changed_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_footer_info.dart';
import 'package:word_quiz/ui/quiz/component/quiz_selection_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/restart_button.dart';
import 'package:word_quiz/ui/quiz/component/result_button.dart';
import 'package:word_quiz/ui/quiz/component/result_view.dart';
import 'package:word_quiz/ui/quiz/component/retire_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_view.dart';
import 'package:word_quiz/ui/quiz/component/word_keyboard.dart';
import 'package:word_quiz/ui/quiz/component/word_names.dart';

/// 問題表示の共通レイアウトです。
class WordQuizLayout extends HookConsumerWidget {
  const WordQuizLayout({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    // アニメーションに連動してQuizProcessを同期するための変数
    final lazyQuizProcess = useState<QuizProcessType?>(null);
    final quizInfo = ref.watch(quizInfoProvider(quizType)).value;
    final inputType = ref.watch(inputTypeRepositoryProvider);
    final wordAnimation = useState<bool>(false);
    final controlEnabled = !wordAnimation.value;
    void wordAnimationCallback() {
      // アニメーション中はquizProcessを同期しない
      if (wordAnimation.value) {
        return;
      }
      lazyQuizProcess.value = quizInfo?.quizProcess;
    }

    // quizProcessの初期設定
    if (lazyQuizProcess.value == null ||
        lazyQuizProcess.value != quizInfo?.quizProcess) {
      wordAnimationCallback();
    }
    wordAnimation.addListener(wordAnimationCallback);
    // debugPrint('$quizType >>> ${quizInfo?.answer?.name}');
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 8),
            WordNames(wordAnimation: wordAnimation),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 752,
                        ),
                        child: Row(
                          children: [
                            if (inputType.valueOrNull == InputTypes.switching)
                              KeyboardSwitchButton(quizPageInfo: quizPageInfo),
                            const Spacer(flex: 2),
                            if (_showAnswer(lazyQuizProcess.value))
                              AnswerButton(quizPageInfo: quizPageInfo),
                            if (_showRetire(lazyQuizProcess.value))
                              RetireButton(enabled: controlEnabled),
                            if (_showGiveUp(lazyQuizProcess.value, quizType))
                              const GiveUpButton(),
                            if (_showNextQuiz(lazyQuizProcess.value, quizType))
                              const NextQuizButton(),
                            if (_showRestart(lazyQuizProcess.value, quizType))
                              RestartButton(quizPageInfo: quizPageInfo),
                            if (_showResult(lazyQuizProcess.value, quizType))
                              ResultButton(quizPageInfo: quizPageInfo),
                            const Spacer(),
                            DeleteButton(enabled: controlEnabled),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    WordKeyboard(wordAnimation: wordAnimation),
                    const SizedBox(height: 8),
                    EnterButton(enabled: controlEnabled),
                    const SizedBox(height: 24),
                    const QuizFooterInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (controlEnabled && quizPageInfo.value.showAnswer)
          Positioned.fill(
            child: AnswerView(quizPageInfo: quizPageInfo),
          ),
        if (quizPageInfo.value.showStatistics)
          Positioned.fill(
            child: StatisticsView(quizPageInfo: quizPageInfo),
          ),
        if (quizPageInfo.value.showQuizSelection)
          Positioned.fill(
            child: QuizSelectionView(quizPageInfo: quizPageInfo),
          ),
        if (controlEnabled && quizPageInfo.value.showResult)
          Positioned.fill(
            child: ResultView(quizPageInfo: quizPageInfo),
          ),
        if (quizPageInfo.value.showQuizChanged)
          Positioned.fill(
            child: QuizChangedView(quizPageInfo: quizPageInfo),
          ),
      ],
    );
  }

  /// 失敗時は答えの表示
  bool _showAnswer(QuizProcessType? quizProcess) =>
      quizProcess == QuizProcessType.failure;

  /// 問題開始中でなければリタイアを表示
  bool _showRetire(QuizProcessType? quizProcess) =>
      quizProcess == QuizProcessType.started;

  /// いっぱいやるモードで正解した場合にあきらめるを表示
  bool _showGiveUp(QuizProcessType? quizProcess, QuizTypes quizType) =>
      quizType == QuizTypes.endless && quizProcess == QuizProcessType.success;

  /// // いっぱいやるモードで正解している場合は「つぎのもんだい」を表示
  bool _showNextQuiz(QuizProcessType? quizProcess, QuizTypes quizType) =>
      quizType == QuizTypes.endless && quizProcess == QuizProcessType.success;

  /// いっぱいやるモードで、問題開始前か失敗か終了時の場合のみ「はじめる」を表示
  bool _showRestart(QuizProcessType? quizProcess, QuizTypes quizType) =>
      quizType == QuizTypes.endless &&
      (quizProcess == QuizProcessType.none ||
          quizProcess == QuizProcessType.failure ||
          quizProcess == QuizProcessType.quit);

  /// いっぱいやるモードで、失敗か終了した場合に結果を表示
  bool _showResult(QuizProcessType? quizProcess, QuizTypes quizType) =>
      quizType == QuizTypes.endless &&
      (quizProcess == QuizProcessType.failure ||
          quizProcess == QuizProcessType.quit);
}
