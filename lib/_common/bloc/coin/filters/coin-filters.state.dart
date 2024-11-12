import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../entities/filter.model.dart';

class CoinFiltersSate {
  static final FilterableProperties<CoinEntity, num> filterableProperties = {
    'Price': (coin) => (() => coin.price),
    'Market Cap': (coin) => (() => coin.marketCap),
    'Volume': (coin) => (() => coin.volume),
  };

  final List<Filter> filters;

  const CoinFiltersSate({this.filters = const []});
}
