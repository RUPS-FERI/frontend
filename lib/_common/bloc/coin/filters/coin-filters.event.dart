import '../../../entities/filter.model.dart';

abstract class CoinFiltersEvent {
  const CoinFiltersEvent();
}

class AddCoinFilter extends CoinFiltersEvent {
  final String name;
  final String property;
  final FilterType type;
  final Map<String, num> params;

  const AddCoinFilter(
      {required this.name,
      required this.property,
      required this.type,
      required this.params});
}

class RemoveCoinFilter extends CoinFiltersEvent {
  final String name;

  const RemoveCoinFilter({required this.name});
}

class ToggleCoinFilter extends CoinFiltersEvent {
  final bool isEnabled;
  final String name;

  const ToggleCoinFilter({required this.name, required this.isEnabled});
}
