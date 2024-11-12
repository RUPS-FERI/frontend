typedef FilterableProperties<C, T> = Map<String, T Function() Function(C)>;

enum FilterType {
  between(name: 'Between'),
  greaterThan(name: 'Greater than'),
  lowerThan(name: 'Lower than');

  final String name;
  const FilterType({ required this.name });

  FilterFunction<num> get function {
    if (this == FilterType.between) return FilterFunction.between;
    if (this == FilterType.greaterThan) return FilterFunction.greaterThan;
    return FilterFunction.smallerThan;
  }
}

class Filter {
    final String name;
    final String? property;
    final FilterType type;
    final FilterFunction<num> filter;
    final Map<String, num> params;
    bool enabled;

    Filter({
      required this.name,
      required this.type,
      required this.filter,
      required this.params,
      this.enabled = true,
      this.property
    });
}

class FilterFunction<T> {
  final Function(T Function() valueFunc, Map<String, T> params) function;

  const FilterFunction({ required this.function });

  static final FilterFunction<num> between = FilterFunction(function: (valueFunc, params) {
    if (!params.keys.contains('min') || !params.keys.contains('max')) throw Exception('Between function must contain min and max parameters');
    num value = valueFunc();
    return value >= params['min']! && value <= params['max']!;
  });

  static final FilterFunction<num> greaterThan = FilterFunction(function: (valueFunc, params) {
    if (!params.keys.contains('lowerBound')) throw Exception('GreaterThan function must contain lowerBound parameters');
    num value = valueFunc();
    return value >= params['lowerBound']!;
  });

  static final FilterFunction<num> smallerThan = FilterFunction(function: (valueFunc, params) {
    if (!params.keys.contains('upperBound')) throw Exception('SmallerThan function must contain upperBound parameters');
    num value = valueFunc();
    return value >= params['upperBound']!;
  });
}

