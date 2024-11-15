import 'package:bloc/bloc.dart';
import 'package:frontend/_common/bloc/coin/list/coin-list.event.dart';
import 'package:frontend/_common/bloc/coin/list/coin-list.state.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';
import 'package:frontend/_common/services/coin-list.service.dart';

import '../../../entities/pagination-data.model.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  CoinListBloc() : super(const CoinListInitialState()) {
    on<LoadCoinsEvent>(_loadCoins);
    on<SearchCoinEvent>(_searchEvent);
  }

  void loadCoins(int page, {String nameSearch = ''}) {
    add(LoadCoinsEvent(page: page, nameSearch: nameSearch.trim()));
  }

  void searchCoins(String query) {
    add(SearchCoinEvent(search: query.trim()));
  }

  void _loadCoins(LoadCoinsEvent event, Emitter<CoinListState> emit) async {
    emit(CoinListLoading());
    String search = event.nameSearch;
    if (search.trim().isEmpty) {
      search = state.nameSearch;
    }
    PaginationData<CoinEntity> coinListResponse =
        await CoinListService.getCoins(
      page: event.page,
      search: search,
      limit: 10,
    );
    emit(CoinListLoaded(data: coinListResponse, nameSearch: search));
  }

  Future<void> _searchEvent(SearchCoinEvent event, Emitter<CoinListState> emit) async {
    emit(CoinListLoading());
    PaginationData<CoinEntity> searchResults = await CoinListService.getCoins(
      page: 1,
      search: event.search,
      limit: 100,
    );
    emit(CoinListLoaded(data: searchResults, nameSearch: event.search));
  }
}
