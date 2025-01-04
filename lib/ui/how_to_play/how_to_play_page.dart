import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';
import 'package:word_quiz/ui/how_to_play/component/advanced_rule.dart';
import 'package:word_quiz/ui/how_to_play/component/for_developers_info.dart';
import 'package:word_quiz/ui/how_to_play/component/link_span.dart';
import 'package:word_quiz/ui/how_to_play/component/rule_content.dart';
import 'package:word_quiz/ui/how_to_play/component/rule_same_word_content.dart';

/// 遊び方のページです。
class HowToPlayPage extends ConsumerWidget {
  const HowToPlayPage({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isParentalControl =
        ref.watch(parentalControlRepositoryProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(
        title: const Text('あそびかた'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.catching_pokemon,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'ワードクイズにようこそ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.catching_pokemon,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'ポケモンの'
                          ' なまえあて'
                          ' ゲームであそべます🎉\n',
                    ),
                    buildLinkSpan(
                      context,
                      text: 'Wordle',
                      link: 'https://www.nytimes.com/games/wordle/',
                      isParentalControl: isParentalControl,
                    ),
                    const TextSpan(text: 'と'),
                    buildLinkSpan(
                      context,
                      text: 'ポケモンWordle',
                      link: 'https://wordle.mega-yadoran.jp/',
                      isParentalControl: isParentalControl,
                    ),
                    const TextSpan(
                      text: 'をさんこうにして つくっています😍\n'
                          'ポケモンの こうしきアプリ ではありません',
                    ),
                  ],
                ),
              ),
              const Divider(),
              const RuleContent(),
              const Divider(),
              const AdvancedRule(),
              const Divider(),
              const RuleSameWordContent(),
              const Divider(),
              const ForDevelopersInfo(),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
