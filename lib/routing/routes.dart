/// ルーティングのパスを定義するクラス
///
/// https://github.com/flutter/samples/blob/main/compass_app/app/lib/routing/routes.dart
abstract final class Routes {
  /// ホームのパス
  static const root = '/';

  /// 問題ページのパス
  static const quiz = '/quiz';

  /// ペアレンタルゲートページのパス
  static const parentalGate = '/parentalgate';

  /// 設定ページのパス
  static const settings = '/settings';

  /// 遊び方ページのパス
  static const howToPlay = '/howtoplay';
}
