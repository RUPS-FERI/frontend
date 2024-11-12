import 'package:bloc/bloc.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../entities/table-column.model.dart';
import 'coin-table-settings.event.dart';
import 'coin-table-settings.state.dart';

class CoinTableSettingsBloc
    extends Bloc<CoinTableSettingsEvent, CoinTableSettingsState> {
  CoinTableSettingsBloc() : super(const InitialCoinTableState()) {
    on<AddVisibleColumn>(_onAddVisibleColumn);
    on<MakeColumnInvisible>(_onRemoveVisibleColumn);
    on<ReorderColumn>(_onReorderColumn);
  }

  List<TableColumn<CoinEntity>> get availableColumns =>
      CoinTableSettingsState.availableColumns;

  makeColumnVisible(String column) => add(AddVisibleColumn(columnName: column));

  makeColumnInvisible(String column) =>
      add(MakeColumnInvisible(columnName: column));

  moveColumn(int oldIndex, int newIndex) =>
      add(ReorderColumn(oldIndex: oldIndex, newIndex: newIndex));

  _onAddVisibleColumn(
      AddVisibleColumn event, Emitter<CoinTableSettingsState> emit) {
    if (!_columnExists(event.columnName)) return;
    emit(CoinTableSettingsState(
        visibleColumns: [...state.visibleColumns, event.columnName]));
  }

  _onRemoveVisibleColumn(
      MakeColumnInvisible event, Emitter<CoinTableSettingsState> emit) {
    if (!_columnExists(event.columnName)) return;
    final List<String> visibleColumns = state.visibleColumns
        .where((column) => column != event.columnName)
        .toList();
    emit(CoinTableSettingsState(visibleColumns: [...visibleColumns]));
  }

  _onReorderColumn(ReorderColumn event, Emitter<CoinTableSettingsState> emit) {
    List<String> visibleColumns = [...state.visibleColumns];
    final String column = visibleColumns.removeAt(event.oldIndex);
    visibleColumns.insert(event.newIndex, column);
    emit(CoinTableSettingsState(visibleColumns: visibleColumns));
  }

  bool _columnExists(String column) =>
      availableColumns.indexWhere((el) => el.name == column) >= 0;
}
