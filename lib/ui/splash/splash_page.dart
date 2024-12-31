import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/provider/splash_page_notifier.dart';
import 'package:word_quiz/ui/how_to_play/how_to_play_page.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';

/// 起動時の処理を行うスプラッシュページです。
class SplashPage extends ConsumerWidget {
  const SplashPage({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashPageNotifier = ref.watch(splashPageNotifierProvider);

    const emptyWidget = Scaffold(
      body: SizedBox.shrink(),
    );

    ref.listen(splashPageNotifierProvider, (previous, next) {
      if (next.valueOrNull != null) {
        launchPage(context, next.value!);
      }
    });

    return splashPageNotifier.when(
      loading: () => emptyWidget,
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text(
            'もんだいが おこりました\nアプリを さいきどう してください',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (value) => emptyWidget,
    );
  }

  /// 適切なページを開きます。
  Future<void> launchPage(
    BuildContext context,
    SplashPageInfo splashPageInfo,
  ) async {
    unawaited(
      Navigator.of(context).pushAndRemoveUntil<void>(
        MaterialPageRoute(
          builder: (context) => const QuizPage(),
        ),
        (route) => false,
      ),
    );

    // あそびかた画面を表示
    if (splashPageInfo.showRule) {
      unawaited(
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (context) => const HowToPlayPage(),
          ),
        ),
      );
    }
  }
}
