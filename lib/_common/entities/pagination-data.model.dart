class PaginationConfig {
  final int page;
  final int totalAmount;
  final int limit;

  const PaginationConfig(
      {required this.page, required this.totalAmount, required this.limit});

  const PaginationConfig.noData() : this(page: 0, totalAmount: 0, limit: 10);

  get finalPage => (totalAmount / limit).ceil() as int;
}

class PaginationData<T> {
  final PaginationConfig config;
  final List<T> items;

  const PaginationData({
    required this.config,
    required this.items,
  });

  const PaginationData.noData()
      : this(
          config: const PaginationConfig.noData(),
          items: const [],
        );
}
