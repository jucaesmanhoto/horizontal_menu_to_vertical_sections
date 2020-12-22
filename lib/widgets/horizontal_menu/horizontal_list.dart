import 'package:flutter/material.dart';

import '../vertical_sections/section_model.dart';
import 'horizontal_menu_item.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key key,
    double horizontalMenuHeight = 40.0,
    @required double menuItemWidth,
    @required List<SectionModel> sections,
    @required ScrollController controller,
    @required int selectedIndex,
    Function({int selectedIndex}) onHorizontalMenuItemSelect,
  })  : _horizontalMenuHeight = horizontalMenuHeight,
        _menuItemWidth = menuItemWidth,
        _controller = controller,
        _onHorizontalMenuItemSelect = onHorizontalMenuItemSelect,
        _sections = sections,
        _selectedIndex = selectedIndex,
        super(key: key);

  final double _horizontalMenuHeight;
  final double _menuItemWidth;
  final ScrollController _controller;
  final Function({int selectedIndex}) _onHorizontalMenuItemSelect;
  final List<SectionModel> _sections;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _horizontalMenuHeight,
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
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
