import 'package:flutter/material.dart';

class Pane extends StatelessWidget {
  final Color? background;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;

  const Pane({
    super.key,
    required this.child,
    this.background,
    this.padding,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      color: background,
      child: child,
    );
  }
}
