import 'package:flutter/material.dart';

class HorizontalMenuItem extends StatelessWidget {
  const HorizontalMenuItem({
    Key key,
    int index,
    bool isActive = true,
    double indicatorTickness,
    int indicatorWidthRelation,
    Color inticatorColor,
    Color baseLineColor,
    Widget title = const Text('Menu Item'),
    Function({int selectedIndex}) onSelect,
    @required GlobalKey menuItemKey,
    double width,
  })  : _indicatorTickness = indicatorTickness,
        _isActive = isActive,
        _indicatorWidthRelation = indicatorWidthRelation,
        _inticatorColor = inticatorColor,
        _baseLineColor = baseLineColor,
        _title = title,
        _onSelect = onSelect,
        _index = index,
        _menuItemKey = menuItemKey,
        _width = width,
        super(key: key);

  final bool _isActive;
  final double _indicatorTickness;
  final int _indicatorWidthRelation;
  final Color _inticatorColor;
  final Color _baseLineColor;
  final Widget _title;
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
            _title,
            SizedBox(height: 12.0),
            Container(
              height: _indicatorTickness,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: _baseLineColor,
                    ),
                  ),
                  Flexible(
                    flex: _indicatorWidthRelation,
                    child: Container(
                      height: _isActive ? _indicatorTickness : 1,
                      width: double.infinity,
                      color: _isActive ? _inticatorColor : _baseLineColor,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 1,
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
