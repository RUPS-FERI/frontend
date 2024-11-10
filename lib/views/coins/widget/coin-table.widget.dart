import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../_common/bloc/coin/list/coin-list.bloc.dart';
import '../../../_common/bloc/coin/list/coin-list.state.dart';
import '../../../_common/utils/color-constants.util.dart';

class CoinTable extends StatelessWidget {
  const CoinTable({super.key});

  @override
  Widget build(BuildContext context) {
    final CoinListBloc coinListBloc = context.read<CoinListBloc>();

    return Expanded(
        child: BlocBuilder<CoinListBloc, CoinListState>(
            bloc: coinListBloc,
            builder: (context, listState) {
              if (listState is CoinListLoaded) {
                final List<CoinEntity> filteredCoins = listState.data.items;
                return Expanded(
                  flex: 10,
                  child: DataTable2(
                    columns: const [
                      DataColumn2(label: Text('Icon')),
                      DataColumn2(label: Text('Name')),
                      DataColumn2(label: Text('Code'))
                    ],
                    rows: filteredCoins
                        .map((coin) => DataRow2(cells: [
                              DataCell(Image.memory(coin.imageBytes)),
                              DataCell(Text(coin.name)),
                              DataCell(Text(coin.code)),
                            ]))
                        .toList(),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.actionBlueColor,
                ),
              );
            }));
  }
}
