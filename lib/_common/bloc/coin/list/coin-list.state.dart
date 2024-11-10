import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../entities/pagination-data.model.dart';

abstract class CoinListState {
  final PaginationData<CoinEntity> data;
  final String nameSearch;

  const CoinListState({required this.data, this.nameSearch = ''});
}

class CoinListInitialState extends CoinListState {
  const CoinListInitialState()
      : super(data: const PaginationData(page: 0, totalAmount: 0, items: []));
}

class CoinListLoaded extends CoinListState {
  CoinListLoaded({required super.data, super.nameSearch});
}

class CoinListLoading extends CoinListInitialState {}
