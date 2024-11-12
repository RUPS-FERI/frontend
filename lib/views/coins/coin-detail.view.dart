import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/_common/bloc/coin/list/coin-list.bloc.dart';
import 'package:frontend/_common/bloc/coin/list/coin-list.state.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../_common/utils/color-constants.util.dart';

class CoinDetailView extends StatelessWidget {
  final String coinId;

  const CoinDetailView({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    final CoinListBloc coinListBloc = context.read<CoinListBloc>();
    return BlocBuilder<CoinListBloc, CoinListState>(
      bloc: coinListBloc,
      builder: (context, state) {
        if (state is CoinListLoaded) {
          final CoinEntity coin = state.data.items.first;
          return Scaffold(
            appBar: AppBar(
              title: Text(coin.name),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ColorConstants.actionBlueColor,
          ),
        );
      },
    );
  }
}
