import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/_common/bloc/pagination/config/pagination-config.bloc.dart';
import 'package:frontend/_common/entities/pagination-data.model.dart';
import 'package:frontend/_common/utils/color-constants.util.dart';

class Pagination extends StatelessWidget {
  final int maxShownPagesAmount;
  final void Function(int) onPageSelected;

  const Pagination({
    super.key,
    required this.onPageSelected,
    this.maxShownPagesAmount = 5,
  });

  @override
  Widget build(BuildContext context) {
    final configBloc = context.read<PaginationConfigBloc>();

    return BlocBuilder<PaginationConfigBloc, PaginationConfig>(
        bloc: configBloc,
        builder: (context, state) {
          if (state.totalAmount == 0) return const SizedBox();

          print(
              "total amount : ${state.totalAmount}, limit : ${state.limit}, finalPage: ${state.finalPage}");

          final shownPagesAmount = min<int>(
            maxShownPagesAmount,
            configBloc.state.finalPage,
          );

          List<int> getShownPages(int activePage) {
            int middle = (shownPagesAmount / 2).floor();
            if (activePage - shownPagesAmount < 0) {
              return List<int>.generate(shownPagesAmount, (i) => i + 1);
            } else if ((activePage + shownPagesAmount) >=
                (configBloc.state.finalPage + middle)) {
              return List<int>.generate(
                  shownPagesAmount,
                  (i) =>
                      (configBloc.state.finalPage - shownPagesAmount) + i + 1);
            }
            return List<int>.generate(
                shownPagesAmount, (i) => activePage - middle + i);
          }

          void setActivePage(int newActivePage) {
            configBloc.setActivePage(newActivePage);
            onPageSelected(newActivePage);
          }

          Widget paginationButton(int page) {
            final isActive = configBloc.state.page == page;
            return TextButton(
              onPressed: () => setActivePage(page),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(isActive
                      ? ColorConstants.actionBlueColor
                      : Colors.transparent),
                  foregroundColor: WidgetStatePropertyAll(
                      isActive ? Colors.white : Colors.black)),
              child: Text(
                '$page',
                textScaler: TextScaler.linear(isActive ? 1.1 : 1),
              ),
            );
          }

          List<Widget> numberButtons(int activePage) {
            final shownPages = getShownPages(activePage);
            final buttons =
                shownPages.map((page) => paginationButton(page)).toList();

            if (shownPages.last != configBloc.state.finalPage) {
              buttons.add(paginationButton(configBloc.state.finalPage));
              buttons.insert(
                shownPages.length,
                const TextButton(
                  onPressed: null,
                  child: Text('...'),
                ),
              );
            }

            if (shownPages.first != 1) {
              buttons.insert(0, paginationButton(1));
              buttons.insert(
                1,
                const TextButton(
                  onPressed: null,
                  child: Text('...'),
                ),
              );
            }

            return buttons;
          }

          final int activePage = state.page;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => setActivePage(activePage - 1),
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
              ...numberButtons(activePage),
              IconButton(
                onPressed: () => setActivePage(activePage + 1),
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          );
        });
  }
}
