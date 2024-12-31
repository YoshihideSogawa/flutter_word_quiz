/// 入力タイプです。
enum InputTypes {
  /// 入力タイプ：切り替え
  switching(0),

  /// 入力タイプ：全表示
  all(1);

  const InputTypes(this.typeId);

  /// 保存用のID
  final int typeId;
}
