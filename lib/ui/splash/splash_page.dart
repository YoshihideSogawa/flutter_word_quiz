import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/provider/splash_page_notifier.dart';
import 'package:word_quiz/routing/routes.dart';

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
    context.go(Routes.quiz);
    // あそびかた画面を表示
    if (splashPageInfo.showRule) {
      if (context.mounted) {
        unawaited(context.push(Routes.howToPlay));
      }
    }
  }
}
