/// 入力キーの状態を表します。
enum WordKeyboardInfo {
  /// 不明(未使用)
  none,

  /// ワード一致
  hit,

  /// 完全一致
  match,

  /// 不一致
  notMatch,
}
