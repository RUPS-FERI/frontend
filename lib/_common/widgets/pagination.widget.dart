import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/_common/entities/pagination-data.model.dart';
import 'package:frontend/_common/utils/color-constants.util.dart';

class Pagination extends StatelessWidget {
  final StreamController<int> _activePageStreamController = StreamController();
  StreamSink<int> get _activePageSink => _activePageStreamController.sink;
  Stream<int> get _activePageStream => _activePageStreamController.stream;

  final PaginationData paginationData;
  final int limit;
  final int shownPagesAmount;
  late final int finalPage;
  final void Function(int) onPageSelected;

  Pagination({
    super.key,
    required this.paginationData,
    required this.onPageSelected,
    this.limit = 10,
    this.shownPagesAmount = 5
  }) {
    finalPage = (paginationData.totalAmount / limit).ceil();
  }


  @override
  Widget build(BuildContext context) {
    _activePageSink.add(paginationData.page);

    return StreamBuilder(
      stream: _activePageStream,
      builder: (context, snapshot) {
        final int activePage = snapshot.data ?? 1;

        final List<int> shownPages = _getShownPages(activePage, shownPagesAmount);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => _setActivePage(activePage - 1),
                color: Colors.black,
                icon: Icon(Icons.arrow_back_ios_new)
            ),
            ..._numberButtons(shownPages, activePage),
            IconButton(
                onPressed: () => _setActivePage(activePage + 1),
                color: Colors.black,
                icon: Icon(Icons.arrow_forward_ios)
            ),
          ],
        );
      }
    );
  }

  List<int> _getShownPages(int activePage, int shownPagesAmount) {
    int middle = (shownPagesAmount / 2).floor();
    if (activePage - shownPagesAmount < 0) {
      return List<int>.generate(shownPagesAmount, (i) =>  i + 1);
    } else if ((activePage + shownPagesAmount) >= (finalPage + middle)) {
      return List<int>.generate(shownPagesAmount, (i) => (finalPage - shownPagesAmount) + i + 1);
    }
    return List<int>.generate(shownPagesAmount, (i) => activePage - middle + i);
  }

  List<Widget> _numberButtons(List<int> shownPages, int activePage) {
    List<Widget> buttons = shownPages.map((page) => _paginationButton(page, activePage == page)).toList();
    
    if (shownPages.last != finalPage) {
      buttons.add(_paginationButton(finalPage, false));
      buttons.insert(shownPages.length, TextButton(onPressed: null, child: Text('...')));
    }

    if (shownPages.first != 1) {
      buttons.insert(0, _paginationButton(1, false));
      buttons.insert(1, TextButton(onPressed: null, child: Text('...')));
    }

    return buttons;
  }

  void _setActivePage(int newActivePage) {
    if (newActivePage < 1 || newActivePage > finalPage) return;
    _activePageSink.add(newActivePage);
    onPageSelected(newActivePage);
  }

  Widget _paginationButton(int page, bool isActive) {
    return TextButton(
      onPressed: () => _setActivePage(page),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(isActive ? ColorConstants.actionBlueColor : Colors.transparent),
          foregroundColor: WidgetStatePropertyAll(isActive ? Colors.white : Colors.black)
      ),
      child: Text(
        '$page',
        textScaler: TextScaler.linear(isActive ? 1.1 : 1),
      ),
    );
  }
}