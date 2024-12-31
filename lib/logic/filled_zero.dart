/// 0埋めするためのextensionです。
extension ZeroFill on int {
  /// 2桁になるように0で埋めます。
  String zeroFill(int digits) => toString().padLeft(digits, '0');
}
