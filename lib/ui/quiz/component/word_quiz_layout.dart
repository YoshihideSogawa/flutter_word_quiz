import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
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
  const WordQuizLayout({super.key}); //coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controlEnabled = useState(true);
    final quizType = QuizType.of(context).quizType;
    final quizInfo = ref.read(quizInfoProvider(quizType)).value;
    final quizPage = ref.watch(quizPageProvider(quizType));
    final inputType = ref.watch(inputTypeRepositoryProvider);
    // debugPrint('$quizType >>> ${quizInfo?.answer?.name}');
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 8),
            WordNames(
              onStartWordAnimation: () {
                controlEnabled.value = false;
              },
              onEndWordAnimation: () {
                controlEnabled.value = true;
              },
            ),
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
                              const KeyboardSwitchButton(),
                            const Spacer(flex: 2),
                            _buildAnswerButton(quizInfo, quizType),
                            _buildRetireButton(
                              quizInfo,
                              quizType,
                              controlEnabled.value,
                            ),
                            _buildGiveUpButton(quizInfo, quizType),
                            _buildNextQuizButton(quizInfo, quizType),
                            _buildRestartButton(quizInfo, quizType),
                            _buildResultButton(quizInfo, quizType),
                            const Spacer(),
                            DeleteButton(enabled: controlEnabled.value),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    WordKeyboard(enabled: controlEnabled.value),
                    const SizedBox(height: 8),
                    EnterButton(enabled: controlEnabled.value),
                    const SizedBox(height: 24),
                    const QuizFooterInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (quizPage.showAnswer)
          const Positioned.fill(
            child: AnswerView(),
          ),
        if (quizPage.showStatistics)
          const Positioned.fill(
            child: StatisticsView(),
          ),
        if (quizPage.showQuizSelection)
          const Positioned.fill(
            child: QuizSelectionView(),
          ),
        if (quizPage.showResult)
          const Positioned.fill(
            child: ResultView(),
          ),
        if (quizPage.showQuizChanged)
          const Positioned.fill(
            child: QuizChangedView(),
          ),
      ],
    );
  }

  /// リスタートボタンを構築します。
  Widget _buildRestartButton(QuizInfo? quizInfo, QuizTypes quizType) {
    // いっぱいやるモードで、問題開始前か失敗か終了時の場合のみ表示
    if (quizType == QuizTypes.endless &&
        (quizInfo?.quizProcess == QuizProcessType.none ||
            quizInfo?.quizProcess == QuizProcessType.failure ||
            quizInfo?.quizProcess == QuizProcessType.quit)) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: RestartButton(),
      );
    }

    return const SizedBox.shrink();
  }

  /// リタイアボタンを構築します。
  Widget _buildRetireButton(
    QuizInfo? quizInfo,
    QuizTypes quizType,
    bool enabled,
  ) {
    // 問題開始中は表示
    if (quizInfo?.quizProcess == QuizProcessType.started) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: RetireButton(
          enabled: enabled,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  /// つぎの問題ボタンを構築します。
  Widget _buildNextQuizButton(QuizInfo? quizInfo, QuizTypes quizType) {
    // いっぱいやるモードで正解している場合
    if (quizType == QuizTypes.endless &&
        quizInfo?.quizProcess == QuizProcessType.success) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: NextQuizButton(),
      );
    }

    return const SizedBox.shrink();
  }

  /// 答えの表示ボタンを構築します。
  Widget _buildAnswerButton(QuizInfo? quizInfo, QuizTypes quizType) {
    // 失敗時のみ表示
    if (quizInfo?.quizProcess == QuizProcessType.failure) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: AnswerButton(),
      );
    }

    return const SizedBox.shrink();
  }

  /// おわりにするボタンを構築します。
  Widget _buildGiveUpButton(QuizInfo? quizInfo, QuizTypes quizType) {
    /// いっぱいやるモードで正解した場合に表示
    if (quizInfo?.quizType == QuizTypes.endless &&
        (quizInfo?.quizProcess == QuizProcessType.success)) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: GiveUpButton(),
      );
    }

    return const SizedBox.shrink();
  }

  /// 結果ボタンを構築します。
  Widget _buildResultButton(QuizInfo? quizInfo, QuizTypes quizType) {
    /// いっぱいやるモードで、失敗か終了した場合に表示
    if (quizInfo?.quizType == QuizTypes.endless &&
        (quizInfo?.quizProcess == QuizProcessType.failure ||
            quizInfo?.quizProcess == QuizProcessType.quit)) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: ResultButton(),
      );
    }

    return const SizedBox.shrink();
  }
}
