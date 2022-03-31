import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';
import 'package:word_quiz/ui/quiz/daily/daily_quiz_page.dart';
import 'package:word_quiz/ui/quiz/endless/endless_quiz_page.dart';

/// クイズページを表示します。
class QuizPage extends HookConsumerWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizTypeIndex = useState(0);
    return Scaffold(
      body: IndexedStack(
        index: quizTypeIndex.value,
        children: const [
          DailyQuizPage(),
          EndlessQuizPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: quizTypeIndex.value,
        onTap: (index) {
          quizTypeIndex.value = index;
        },
        selectedItemColor: _selectedColor(quizTypeIndex.value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon_outlined),
            label: 'きょうのもんだい',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_very_satisfied),
            label: 'いっぱいやる',
          ),
        ],
      ),
    );
  }

  /// 選択中の色を取得します。
  Color? _selectedColor(int index) {
    if (index == 0) {
      return dailyQuizColor;
    } else if (index == 1) {
      return endlessQuizColor;
    }

    return null;
  }
}
