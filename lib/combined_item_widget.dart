import 'package:flutter/material.dart';

class CombinedItem {
  final Widget header;
  final Widget? headerSelected;
  final Widget body;

  CombinedItem({required this.header, required this.body, this.headerSelected});
}
