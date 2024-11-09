import 'package:flutter/material.dart';

import '../../utils/color-constants.util.dart';
import '../pane.wdiget.dart';

class TwoPaneLayout extends StatelessWidget {
  final Color backgroundColor;
  final Pane leftPane;
  final Pane rightPane;

  const TwoPaneLayout({
    super.key,
    this.backgroundColor = ColorConstants.scaffoldBackgroundColor,
    required this.leftPane,
    required this.rightPane,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 3,
            child: leftPane,
          ),
          Expanded(
            flex: 8,
            child: rightPane,
          ),
        ],
      ),
    );
  }
}


