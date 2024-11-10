class PaginationData<T> {
  final int page;
  final int totalAmount;
  final List<T> items;

  const PaginationData({
    required this.page,
    required this.totalAmount,
    required this.items
  });
}