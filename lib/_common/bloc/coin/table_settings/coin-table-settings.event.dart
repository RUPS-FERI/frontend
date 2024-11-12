abstract class CoinTableSettingsEvent {
  const CoinTableSettingsEvent();
}
class AddVisibleColumn extends CoinTableSettingsEvent {
  final String columnName;
  const AddVisibleColumn({ required this.columnName });
}

class MakeColumnInvisible extends CoinTableSettingsEvent {
  final String columnName;
  const MakeColumnInvisible({ required this.columnName });
}

class ReorderColumn extends CoinTableSettingsEvent {
  final int oldIndex;
  final int newIndex;

  const ReorderColumn({
    required this.oldIndex,
    required this.newIndex
  });
}