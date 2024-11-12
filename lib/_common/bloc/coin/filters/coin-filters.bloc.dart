import 'package:bloc/bloc.dart';
import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../../../entities/filter.model.dart';
import 'coin-filters.event.dart';
import 'coin-filters.state.dart';

class CoinFiltersBloc extends Bloc<CoinFiltersEvent, CoinFiltersSate> {
  CoinFiltersBloc() : super(const CoinFiltersSate()) {
    on<AddCoinFilter>(_onAddCoinFilter);
    on<RemoveCoinFilter>(_onRemoveCoinFilter);
    on<ToggleCoinFilter>(_onToggleCoinFilter);
  }

  static FilterableProperties<CoinEntity, num> get availableFilterProperties =>
      CoinFiltersSate.filterableProperties;

  void createFilter(String filterName, String propertyName, FilterType type,
      Map<String, num> params) {
    add(AddCoinFilter(
        name: filterName, property: propertyName, type: type, params: params));
  }

  void removeFilter(String filterName) {
    add(RemoveCoinFilter(name: filterName));
  }

  void toggleFilter(String filterName, bool isEnabled) {
    add(ToggleCoinFilter(name: filterName, isEnabled: isEnabled));
  }

  void _onAddCoinFilter(AddCoinFilter event, Emitter<CoinFiltersSate> emit) {
    final List<Filter> filters = [...state.filters];
    filters.add(Filter(
        name: event.name,
        type: event.type,
        params: event.params,
        filter: event.type.function,
        property: event.property));
    emit(CoinFiltersSate(filters: filters));
  }

  void _onRemoveCoinFilter(
      RemoveCoinFilter event, Emitter<CoinFiltersSate> emit) {
    final List<Filter> filters = [...state.filters];
    filters.removeWhere((filter) => filter.name == event.name);
    emit(CoinFiltersSate(filters: filters));
  }

  void _onToggleCoinFilter(
      ToggleCoinFilter event, Emitter<CoinFiltersSate> emit) {
    final List<Filter> filters = [...state.filters];
    emit(CoinFiltersSate(
        filters: filters.map((filter) {
      if (filter.name == event.name) {
        filter.enabled = event.isEnabled;
      }
      return filter;
    }).toList()));
  }
}
