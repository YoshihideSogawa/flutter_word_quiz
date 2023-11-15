import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/parental_gate_page_notifier.dart';

/// ペアレンタルゲートページです。(Apple用)
class ParentalGatePage extends HookConsumerWidget {
  const ParentalGatePage({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answerNum = useState(1);
    final parentalGate = ref.watch(parentalGatePageNotifierProvider);

    /// 回答ボタンをタップした時の処理を行います。
    void onTapAnswerButton({required bool isCorrect}) {
      if (isCorrect) {
        // 回答上限数を超えていたら終了
        if (answerNum.value >= parentalGate.maxAnswerNum) {
          // ペアレンタルコントロールのオフ
          ref
              .read(parentalGatePageNotifierProvider.notifier)
              .updateParentalControl(parentalControl: false);
          _showSuccessDialog(context);
        } else {
          answerNum.value++;
        }
      } else {
        // ペアレンタルコントロールのオン
        ref
            .read(parentalGatePageNotifierProvider.notifier)
            .updateParentalControl(parentalControl: true);
        _showFailedDialog(context);
      }
    }

    final targetData = parentalGate.parentGateDataList[answerNum.value];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ねんれいかくにん'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Text(
                '${targetData.question}を選んでください'
                '(${answerNum.value}/${parentalGate.maxAnswerNum})',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              for (final answer in targetData.answerList!)
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () => onTapAnswerButton(
                      isCorrect: answer == targetData.correct,
                    ),
                    child: Text(answer),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// 制限解除失敗ダイアログを表示します。
  void _showSuccessDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: const Text(
          'シェアなどの いちぶきのうを かいじょしました\n'
          'ワードクイスをおたのしみください',
        ),
        actions: [
          TextButton(
            onPressed: () => _navigatePage(context),
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
  }

  /// 制限解除失敗ダイアログを表示します。
  void _showFailedDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: const Text('シェアなどの いちぶきのうを せいげんします'),
        actions: [
          TextButton(
            onPressed: () => _navigatePage(context),
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
  }

  /// もとのページに遷移します。
  void _navigatePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.maybePop(context);
  }
}
