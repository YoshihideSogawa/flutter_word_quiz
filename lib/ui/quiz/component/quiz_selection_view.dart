import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';
import 'package:word_quiz/repository/settings/quiz_range_repository.dart';
import 'package:word_quiz/ui/quiz/component/quiz_dialog.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 問題の選択を行う画面です。(いっぱいやるモードのみ)
class QuizSelectionView extends HookConsumerWidget {
  const QuizSelectionView({
    super.key,
    required this.quizPageInfo,
  });

  /// [QuizPageInfo]
  final ValueNotifier<QuizPageInfo> quizPageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = QuizType.of(context).quizType;
    // 初期入力はランダムにモンスターを選択
    final randomPickFuture = useMemoized<Future<Monster?>>(
      () => ref.watch(monsterListRepositoryProvider.notifier).pick(),
    );
    final snapshot = useFuture(randomPickFuture);
    if (!snapshot.hasData) {
      return const SizedBox.shrink();
    }
    final seedController =
        useTextEditingController(text: snapshot.data?.name ?? '');

    // 問題の範囲を取得して、ドロップダウンに反映
    final quizRangeNotifier = ref.watch(quizRangeRepositoryProvider);
    if (!quizRangeNotifier.hasValue) {
      return const SizedBox.shrink();
    }
    final dropdownValue = useState<QuizRange>(quizRangeNotifier.value!);

    return QuizDialog(
      onTap: () {
        quizPageInfo.value = quizPageInfo.value.copyWith(
          showQuizSelection: false,
        );
      },
      child: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
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
                const Text(
                  'なんもん れんぞくで せいかい できるかな？',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11),
                ),
                const Divider(),
                const Text(
                  'もんだいのはんい',
                  style: TextStyle(fontSize: 10.5),
                ),
                _buildQuizRangeDropDown(dropdownValue),
                const SizedBox(height: 16),
                const Text(
                  'あいことば',
                  style: TextStyle(fontSize: 10.5),
                ),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: seedController,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: '',
                      counterText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  key: const Key('start_button'),
                  onPressed: () {
                    // 入力がない場合は何もしない
                    if (seedController.text.isEmpty) {
                      return;
                    }

                    // 回答を設定
                    ref
                        .read(quizInfoProvider(quizType).notifier)
                        .startQuiz(seedController.text, dropdownValue.value);
                    // 画面を閉じる
                    quizPageInfo.value = quizPageInfo.value.copyWith(
                      showQuizSelection: false,
                    );
                  },
                  child: const Text('スタート'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 問題の範囲選択を構築します。
  Widget _buildQuizRangeDropDown(ValueNotifier<QuizRange> dropdownValue) {
    return DropdownButton<QuizRange>(
      value: dropdownValue.value,
      items: [
        ...quizRangeList.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e.displayName ?? ''),
          ),
        ),
      ],
      onChanged: (value) {
        dropdownValue.value = value!;
      },
    );
  }
}
