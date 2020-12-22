import 'package:flutter/material.dart';

import '../vertical_sections/section_model.dart';
import 'horizontal_menu_item.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key key,
    @required double menuItemWidth,
    @required List<SectionModel> sections,
    @required ScrollController controller,
    @required int selectedIndex,
    final Color baseLineColor,
    final Color inticatorColor,
    final double indicatorThickness,
    final int indicatorWidthRelation,
    Function({int selectedIndex}) onHorizontalMenuItemSelect,
  })  : _baseLineColor = baseLineColor,
        _inticatorColor = inticatorColor,
        _indicatorThickness = indicatorThickness,
        _indicatorWidthRelation = indicatorWidthRelation,
        _menuItemWidth = menuItemWidth,
        _controller = controller,
        _onHorizontalMenuItemSelect = onHorizontalMenuItemSelect,
        _sections = sections,
        _selectedIndex = selectedIndex,
        super(key: key);

  final double _menuItemWidth;
  final ScrollController _controller;
  final Function({int selectedIndex}) _onHorizontalMenuItemSelect;
  final List<SectionModel> _sections;
  final int _selectedIndex;
  final Color _baseLineColor;
  final Color _inticatorColor;
  final double _indicatorThickness;
  final int _indicatorWidthRelation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _sections.map((section) {
            return Container(
              width: _menuItemWidth,
              child: HorizontalMenuItem(
                index: _sections.indexOf(section),
                menuItemKey: section.menuItemKey,
                title: section.horizontalMenuTitle,
                onSelect: ({int selectedIndex}) {
                  _onHorizontalMenuItemSelect(selectedIndex: selectedIndex);
                },
                isActive: _selectedIndex == _sections.indexOf(section),
                baseLineColor: _baseLineColor,
                indicatorTickness: _indicatorThickness,
                indicatorWidthRelation: _indicatorWidthRelation,
                inticatorColor: _inticatorColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
