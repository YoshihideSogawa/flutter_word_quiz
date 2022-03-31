/// 入力名の状態を表します。
enum WordNameState {
  /// 入力なし
  none,

  /// ワード一致
  hit,

  /// 完全一致
  match,

  /// 不一致
  notMatch,
}
