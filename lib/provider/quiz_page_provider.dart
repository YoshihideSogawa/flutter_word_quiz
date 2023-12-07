import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';

/// 問題ページのProviderです。
@Deprecated('Use hook')
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

  /// 問題選択を表示します。
  void showQuizSelection() {
    state = state.copyWith(
      showQuizSelection: true,
    );
  }

  /// 問題が切り替わったことを示す表示を行います。(きょうのもんだいのみ)
  void showQuizChanged() {
    state = state.copyWith(
      showQuizChanged: true,
    );
  }
}
