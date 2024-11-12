import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/_common/bloc/coin/table_settings/coin-table-settings.bloc.dart';
import 'package:frontend/_common/bloc/coin/table_settings/coin-table-settings.state.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../_common/bloc/coin/list/coin-list.bloc.dart';
import '../../../_common/bloc/coin/list/coin-list.state.dart';
import '../../../_common/bloc/pagination/config/pagination-config.bloc.dart';
import '../../../_common/utils/color-constants.util.dart';
import '../../../_common/widgets/pagination.widget.dart';

class CoinTable extends StatelessWidget {
  final Color color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CoinTable({
    super.key,
    this.color = Colors.white,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final CoinListBloc coinListBloc = context.read<CoinListBloc>();
    final CoinTableSettingsBloc tableSettingsBloc =
        context.read<CoinTableSettingsBloc>();
    final paginationConfigBloc = context.read<PaginationConfigBloc>();

    int currentPage = 1;

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 10,
            child: BlocBuilder<CoinTableSettingsBloc, CoinTableSettingsState>(
                bloc: tableSettingsBloc,
                builder: (context, tableState) {
                  if (tableState.visibleColumns.isEmpty) {
                    return Center(
                      child: Text(AppLocalizations.of(context)!.noColumns),
                    );
                  }
                  return BlocBuilder<CoinListBloc, CoinListState>(
                      bloc: coinListBloc,
                      builder: (context, listState) {
                        DataRow2 getItemDataRow(CoinEntity item) {
                          List<DataCell> itemDataCells = tableState
                              .visibleColumns
                              .map((column) => DataCell(CoinTableSettingsState
                                  .availableColumns
                                  .firstWhere((col) => col.name == column)
                                  .builder(item)))
                              .toList();
                          return DataRow2(cells: itemDataCells);
                        }

                        List<DataColumn2> columns() => tableState.visibleColumns
                            .map((option) => DataColumn2(label: Text(option)))
                            .toList();

                        List<DataRow2> dataRows() =>
                            listState.data.items.map(getItemDataRow).toList();

                        if (listState is CoinListLoaded) {
                          final List<CoinEntity> filteredCoins =
                              listState.data.items;
                          paginationConfigBloc.setAll(listState.data.config);

                          if (filteredCoins.isEmpty) {
                            return Center(
                              child: Text(
                                  AppLocalizations.of(context)!.noCoinsMessage),
                            );
                          }

                          return DataTable2(
                            columns: columns(),
                            rows: dataRows(),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: ColorConstants.actionBlueColor,
                          ),
                        );
                      });
                }),
          ),
          Expanded(
            flex: 1,
            child: Pagination(
              onPageSelected: (newPage) {
                // Handle page change
                currentPage = newPage;
                coinListBloc.loadCoins(currentPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
