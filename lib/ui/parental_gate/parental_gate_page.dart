import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/parental_gate_provider.dart';
import 'package:word_quiz/ui/splash/splash_page.dart';

/// ペアレンタルゲートページです。(Apple用)
class ParentalGatePage extends ConsumerWidget {
  const ParentalGatePage({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentalGate = ref.watch(parentalGatePageProvider);
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
                '${parentalGate.targetData?.question}を選んでください'
                '(${parentalGate.answerNum}/${parentalGate.maxAnswerNum})',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              for (var answer in parentalGate.targetData!.answerList!)
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () => _onTapAnswerButton(
                      context,
                      ref,
                      answer == parentalGate.targetData!.correct,
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
            onPressed: () => _navigateSplashPage(context),
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
            onPressed: () => _navigateSplashPage(context),
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
  }

  /// 回答ボタンをタップした時の処理を行います。
  void _onTapAnswerButton(BuildContext context, WidgetRef ref, bool isCorrect) {
    if (isCorrect) {
      final parentalGate = ref.read(parentalGatePageProvider);
      // 回答上限数を超えていたら終了
      if (parentalGate.answerNum >= parentalGate.maxAnswerNum) {
        // ペアレンタルコントロールのオフ
        ref
            .read(parentalGatePageProvider.notifier)
            .updateParentalControl(parentalControl: false);
        _showSuccessDialog(context);
      } else {
        ref.read(parentalGatePageProvider.notifier).pick();
      }
    } else {
      // ペアレンタルコントロールのオン
      ref
          .read(parentalGatePageProvider.notifier)
          .updateParentalControl(parentalControl: true);
      _showFailedDialog(context);
    }
  }

  /// スプラッシュページに遷移します。
  void _navigateSplashPage(BuildContext context) {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute(
        builder: (context) => const SplashPage(),
      ),
      (route) => false,
    );
  }
}
