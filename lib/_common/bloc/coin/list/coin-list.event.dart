abstract class CoinListEvent {
  const CoinListEvent();
}

class LoadCoinsEvent extends CoinListEvent {
  final int page;
  final String nameSearch;
  const LoadCoinsEvent({ required this.page, this.nameSearch = '' });
}
