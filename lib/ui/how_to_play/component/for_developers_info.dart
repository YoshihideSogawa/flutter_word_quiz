import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';
import 'package:word_quiz/ui/how_to_play/component/link_span.dart';

/// アプリ開発者に向けての情報です。
class ForDevelopersInfo extends ConsumerWidget {
  const ForDevelopersInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isParentalControl =
        ref.watch(parentalControlRepositoryProvider).valueOrNull;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            '🖥アプリ開発者にむけて🖥',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'このアプリはYoshihideSogawaがFlutterの学習のために作成したアプリです。'
                    '\nソースコードはすべて',
              ),
              buildLinkSpan(
                context,
                text: 'オープンソース',
                link: 'https://github.com/YoshihideSogawa/flutter_word_quiz',
                isParentalControl: isParentalControl,
              ),
              const TextSpan(
                text: 'として公開しておりますので、Flutter開発者・'
                    'これからFlutterを始める方にはぜひレビューいただければ幸いです。\n',
              ),
              const TextSpan(
                text: '不具合報告・修正などはアプリストアだけでなく、プルリクやissueを通して受け付けております。',
              ),
            ],
          ),
          key: const Key('for_developer'),
        ),
      ],
    );
  }
}
