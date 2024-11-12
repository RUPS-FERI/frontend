abstract class CoinListEvent {
  const CoinListEvent();
}

class LoadCoinsEvent extends CoinListEvent {
  final int page;
  final String nameSearch;

  const LoadCoinsEvent({required this.page, this.nameSearch = ''});
}

class LoadCoinByIdEvent extends CoinListEvent {
  final String id;

  const LoadCoinByIdEvent({required this.id});
}

class SearchCoinEvent extends CoinListEvent {
  final String search;

  const SearchCoinEvent({required this.search});
}
