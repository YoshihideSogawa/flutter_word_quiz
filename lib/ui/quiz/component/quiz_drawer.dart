import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:word_quiz/routing/routes.dart';

/// クイズ画面共通のドロワーです。
class QuizDrawer extends StatelessWidget {
  const QuizDrawer({
    super.key,
  }); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.catching_pokemon,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 12),
                Text(
                  'ワードクイズ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.catching_pokemon,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.insert_emoticon),
            title: const Text('あそびかた'),
            onTap: () {
              Navigator.pop(context);
              context.push(Routes.howToPlay);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('せってい'),
            onTap: () {
              Navigator.pop(context);
              context.push(Routes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('このアプリについて'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationLegalese:
                    '本アプリは個人ファンアプリであり、株式会社ポケモン他企業様とは一切関係ありません。\n'
                    'ポケットモンスター・ポケモン・Pokémonは任天堂・クリーチャーズ・ゲームフリークの登録商標です。',
                applicationIcon: const Icon(
                  Icons.catching_pokemon,
                  color: Colors.redAccent,
                  size: 36,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
