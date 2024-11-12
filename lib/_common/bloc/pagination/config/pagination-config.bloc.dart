import 'package:bloc/bloc.dart';
import 'package:frontend/_common/bloc/pagination/config/pagination-config.event.dart';

import '../../../entities/pagination-data.model.dart';

class PaginationConfigBloc
    extends Bloc<PaginationConfigEvent, PaginationConfig> {
  PaginationConfigBloc() : super(const PaginationConfig.noData()) {
    on<PaginationTotalAmountChanged>(_totalAmountChanged);
    on<PaginationPageChanged>(_pageChanged);
    on<PaginationChanged>(_onAllChanged);
  }

  void setActivePage(int newActivePage) {
    if (newActivePage < 1 || newActivePage > state.finalPage) return;
    add(PaginationPageChanged(page: newActivePage));
  }

  void setTotalAmount(int totalAmount) {
    add(PaginationTotalAmountChanged(totalAmount: totalAmount));
  }

  void setAll(PaginationConfig config) {
    add(PaginationChanged(config: config));
  }

  void _totalAmountChanged(
    PaginationTotalAmountChanged event,
    Emitter<PaginationConfig> emit,
  ) {
    emit(PaginationConfig(
      page: state.page,
      totalAmount: event.totalAmount,
      limit: state.limit,
    ));
  }

  void _pageChanged(
    PaginationPageChanged event,
    Emitter<PaginationConfig> emit,
  ) {
    emit(PaginationConfig(
      page: event.page,
      totalAmount: state.totalAmount,
      limit: state.limit,
    ));
  }

  void _onAllChanged(
    PaginationChanged event,
    Emitter<PaginationConfig> emit,
  ) {
    emit(event.config);
  }
}
