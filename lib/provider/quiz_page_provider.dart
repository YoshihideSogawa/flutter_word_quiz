import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';

/// 問題ページのProviderです。
final quizPageProvider =
    StateNotifierProvider.family<QuizPageNotifier, QuizPageInfo, QuizTypes>(
  (ref, quizType) => QuizPageNotifier(),
);

class QuizPageNotifier extends StateNotifier<QuizPageInfo> {
  QuizPageNotifier() : super(const QuizPageInfo());

  /// 統計画面を表示します。
  void showStatistics() {
    state = state.copyWith(
      showStatistics: true,
    );
  }

  /// 統計画面を非表示にします。
  void dismissStatistics() {
    state = state.copyWith(
      showStatistics: false,
    );
  }

  /// 答え画面を表示します。
  void showAnswer() {
    state = state.copyWith(
      showAnswer: true,
    );
  }

  /// 答え画面を非表示にします。
  void dismissAnswer() {
    state = state.copyWith(
      showAnswer: false,
    );
  }

  /// キーボードを切り替えます。
  void updateKeyboard({
    required bool isNormalKeyboard,
  }) {
    state = state.copyWith(
      normalKeyboard: isNormalKeyboard,
    );
  }

  /// 問題選択を表示します。
  void showQuizSelection() {
    state = state.copyWith(
      showQuizSelection: true,
    );
  }

  /// 問題選択を非表示にします。
  void dismissQuizSelection() {
    state = state.copyWith(
      showQuizSelection: false,
    );
  }

  /// 結果を表示します。
  void showResult() {
    state = state.copyWith(
      showResult: true,
    );
  }

  /// 結果を非表示にします。
  void dismissResult() {
    state = state.copyWith(
      showResult: false,
    );
  }

  /// 問題が切り替わったことを示す表示を行います。(きょうのもんだいのみ)
  void showQuizChanged() {
    state = state.copyWith(
      showQuizChanged: true,
    );
  }

  /// 問題が切り替わったことを示す表示を非表示にします。(きょうのもんだいのみ)
  void dismissQuizChanged() {
    state = state.copyWith(
      showQuizChanged: false,
    );
  }
}
