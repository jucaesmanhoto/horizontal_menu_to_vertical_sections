import 'package:flutter/material.dart';

class SectionModel {
  final int sectionIndex;
  final Widget sectionHeader;
  final Widget horizontalMenuTitle;
  final List<Widget> sectionItems;
  final GlobalKey sectionKey = GlobalKey();
  final GlobalKey menuItemKey = GlobalKey();

  SectionModel({
    this.sectionIndex,
    this.sectionHeader,
    this.sectionItems,
    this.horizontalMenuTitle,
  });
}
