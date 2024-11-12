import 'package:flutter/material.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../entities/table-column.model.dart';

class CoinTableSettingsState {
  static final List<TableColumn<CoinEntity>> availableColumns = List.of([
    TableColumn(
      name: 'Icon',
      builder: (coin) => Padding(
        padding: const EdgeInsets.all(3.4),
        child: Image.memory(coin.imageBytes),
      ),
    ),
    TableColumn(name: 'Name', builder: (coin) => Text(coin.name)),
    TableColumn(name: 'Code', builder: (coin) => Text(coin.code)),
    TableColumn(
      name: 'Price',
      builder: (coin) => Text(
        coin.prices.last.price.toStringAsFixed(4),
      ),
    ),
  ]);

  final List<String> visibleColumns;

  List<String> get invisibleColumns => availableColumns
      .where((el) => !visibleColumns.contains(el.name))
      .map((el) => el.name)
      .toList();

  const CoinTableSettingsState({required this.visibleColumns});
}

class InitialCoinTableState extends CoinTableSettingsState {
  const InitialCoinTableState()
      : super(visibleColumns: const ['Icon', 'Code', 'Name', 'Price']);
}
