import 'package:flutter/material.dart';

class TitledListView<T> extends StatelessWidget {
  final String title;
  final double titleFactor;
  final List<T> items;
  final Widget Function(T) builder;

  const TitledListView(
      {super.key,
      required this.title,
      required this.items,
      required this.builder,
      this.titleFactor = 1.5});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textScaler: TextScaler.linear(titleFactor),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => builder(items[index])),
        )
      ],
    );
  }
}
