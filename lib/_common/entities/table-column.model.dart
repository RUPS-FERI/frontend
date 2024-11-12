import 'package:flutter/cupertino.dart';

class TableColumn<T> {
  final String name;
  final Widget Function(T) builder;

  const TableColumn({
    required this.name,
    required this.builder
  });
}