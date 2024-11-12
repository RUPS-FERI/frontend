import 'package:flutter/material.dart';

class ReorderableTitledListView<T> extends StatefulWidget {
  final String title;
  final double titleFactor;
  final Widget Function(T) builder;
  final void Function(int, int) onReorder;
  final List<T> items;

  const ReorderableTitledListView({
    required this.title,
    required this.builder,
    this.titleFactor = 1.5,
    required this.onReorder,
    required this.items,
  });

  @override
  State<ReorderableTitledListView<T>> createState() => _ReorderableTitledListViewState<T>();
}

class _ReorderableTitledListViewState<T> extends State<ReorderableTitledListView<T>> {
  List<T> get items => [...widget.items];

  @override
  void initState() {
    super.initState();
  }

  _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final T item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
      widget.onReorder(oldIndex, newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          textScaler: TextScaler.linear(widget.titleFactor),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ReorderableListView.builder(
            itemCount: items.length,
            onReorder: _onReorder,
            itemBuilder: (context, index) => Container(
              key: ValueKey(widget.items[index]),
              child: widget.builder(items[index]),
            ),
          ),
        )
      ],
    );
  }
}
