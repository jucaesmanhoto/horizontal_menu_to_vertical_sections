import 'package:flutter/material.dart';

class SectionModel {
  final int sectionIndex;
  final Widget sectionHeader;
  final Widget horizontalelectedMenuTitle;
  final Widget horizontalMenuTitle;
  final List<Widget> sectionItems;
  final GlobalKey sectionKey = GlobalKey();
  final GlobalKey menuItemKey = GlobalKey();

  SectionModel({
    @required this.sectionIndex,
    @required this.sectionHeader,
    @required this.sectionItems,
    this.horizontalelectedMenuTitle,
    @required this.horizontalMenuTitle,
  });
}
