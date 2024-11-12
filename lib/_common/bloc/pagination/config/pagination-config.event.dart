import '../../../entities/pagination-data.model.dart';

abstract class PaginationConfigEvent {
  const PaginationConfigEvent();
}

class PaginationChanged extends PaginationConfigEvent {
  final PaginationConfig config;

  const PaginationChanged({required this.config});
}

class PaginationTotalAmountChanged extends PaginationConfigEvent {
  final int totalAmount;

  const PaginationTotalAmountChanged({required this.totalAmount});
}

class PaginationPageChanged extends PaginationConfigEvent {
  final int page;

  const PaginationPageChanged({required this.page});
}
