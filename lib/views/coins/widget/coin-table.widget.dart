import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../_common/bloc/coin/list/coin-list.bloc.dart';
import '../../../_common/bloc/coin/list/coin-list.state.dart';
import '../../../_common/utils/color-constants.util.dart';
import '../../../_common/widgets/pagination.widget.dart';

class CoinTable extends StatelessWidget {
  final Color color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CoinTable(
      {super.key, this.color = Colors.white, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    final CoinListBloc coinListBloc = context.read<CoinListBloc>();
    int currentPage = 1;

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: BlocBuilder<CoinListBloc, CoinListState>(
          bloc: coinListBloc,
          builder: (context, listState) {
            if (listState is CoinListLoaded) {
              final List<CoinEntity> filteredCoins = listState.data.items;
              
              return Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: 
                      DataTable2(
                      columns: const [
                        DataColumn2(label: Text('Icon')),
                        DataColumn2(label: Text('Name')),
                        DataColumn2(label: Text('Code')),
                      ],
                      rows: filteredCoins
                          .map((coin) => DataRow2(cells: [
                                DataCell(Image.memory(coin.imageBytes)),
                                DataCell(Text(coin.name)),
                                DataCell(Text(coin.code)),
                              ]))
                          .toList(),
                      ),
                  ),
                  
                  Expanded(
                    flex: 1,
                    child: 
                      Pagination(
                        paginationData: listState.data,
                        onPageSelected: (newPage) {
                          // Handle page change
                          currentPage = newPage;
                          coinListBloc.loadCoins(currentPage);
                        },
                      ),
                  ),
                  
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: ColorConstants.actionBlueColor,
              ),
            );
          }),
    );
  }
}
