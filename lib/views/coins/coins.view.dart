import 'package:flutter/material.dart';
import 'package:frontend/_common/widgets/layout/two-pane.layout.dart';
import 'package:frontend/_common/widgets/pane.wdiget.dart';
import 'package:frontend/_common/widgets/search-bar-input.widget.dart';
import 'package:frontend/views/coins/widget/coins-sidebar.widget.dart';

class CoinsView extends StatelessWidget {
  const CoinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TwoPaneLayout(
      leftPane: Pane(
        background: Color(0xFFF6F6F6),
        child: CoinsSideBar(),
      ),

      rightPane: Pane(
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchBarInput(),
          ],
        ),
      ),
    );
  }
}
