import 'package:flutter/material.dart';

class HorizontalMenuItem extends StatelessWidget {
  const HorizontalMenuItem({
    Key key,
    @required int index,
    @required bool isActive, // = true,
    @required double indicatorTickness,
    @required Color inticatorColor,
    @required int indicatorWidthRelationFlex,
    @required int baseLineWidthRelationFlex,
    @required Color baseLineColor,
    @required double baseLineThickness,
    @required Widget title, // = const Text('Menu Item'),
    Widget activeTitle, // = const Text('Menu Item'),
    @required Function({int selectedIndex}) onSelect,
    @required GlobalKey menuItemKey,
    double width,
  })  : _isActive = isActive,
        _indicatorWidthRelationFlex = indicatorWidthRelationFlex,
        _baseLineWidthRelationFlex = baseLineWidthRelationFlex,
        _inticatorColor = inticatorColor,
        _indicatorTickness = indicatorTickness,
        _baseLineColor = baseLineColor,
        _baseLineThickness = baseLineThickness,
        _title = title,
        _onSelect = onSelect,
        _index = index,
        _menuItemKey = menuItemKey,
        _activeTitle = activeTitle,
        _width = width,
        super(key: key);

  final bool _isActive;
  final int _indicatorWidthRelationFlex;
  final int _baseLineWidthRelationFlex;
  final Color _inticatorColor;
  final double _indicatorTickness;
  final Color _baseLineColor;
  final double _baseLineThickness;
  final Widget _title;
  final Widget _activeTitle;
  final Function({int selectedIndex}) _onSelect;
  final int _index;
  final GlobalKey _menuItemKey;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: _menuItemKey,
      onTap: () {
        _onSelect(selectedIndex: _index);
      },
      child: Container(
        width: _width,
        child: Column(
          children: [
            _isActive ? (_activeTitle ?? _title) : _title,
            SizedBox(height: 12.0),
            Container(
              height: _indicatorTickness,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: _baseLineColor,
                    height: _baseLineThickness,
                  ),
                  Flexible(
                    flex: _baseLineWidthRelationFlex,
                    child: Container(
                      height: _baseLineThickness,
                      width: double.infinity,
                      color: _baseLineColor,
                    ),
                  ),
                  Flexible(
                    flex: _indicatorWidthRelationFlex,
                    child: Container(
                      height:
                          _isActive ? _indicatorTickness : _baseLineThickness,
                      width: double.infinity,
                      color: _isActive ? _inticatorColor : _baseLineColor,
                    ),
                  ),
                  Flexible(
                    flex: _baseLineWidthRelationFlex,
                    child: Container(
                      height: _baseLineThickness,
                      width: double.infinity,
                      color: _baseLineColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
