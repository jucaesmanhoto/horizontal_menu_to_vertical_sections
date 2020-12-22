import 'package:flutter/material.dart';

import 'horizontal_menu/horizontal_list.dart';
import 'vertical_sections/section_model.dart';
import 'vertical_sections/vertical_list.dart';

class MainWidget extends StatefulWidget {
  final List<SectionModel> sections;
  final double menuItemWidth;
  final double height;
  final double width;
  final int horizontalScrollDurationInMilliseconds;
  final int verticalScrollDurationInMilliseconds;

  const MainWidget({
    Key key,
    this.sections,
    this.menuItemWidth = 80.0,
    this.height = 611,
    this.width = 375,
    this.horizontalScrollDurationInMilliseconds = 250,
    this.verticalScrollDurationInMilliseconds = 350,
  }) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final ScrollController _verticalScroll = ScrollController();
  final ScrollController _horizontalScroll = ScrollController();
  final List<double> _initialVerticalPositions = [];
  final List<double> _initialHorizontalPositions = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getVerticalPositions();
      _getHorizontalPositions();
      _verticalScroll.addListener(_addVerticalScrollListeners);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Column(
          children: [
            HorizontalList(
              selectedIndex: _selectedIndex,
              controller: _horizontalScroll,
              menuItemWidth: widget.menuItemWidth,
              sections: widget.sections,
              onHorizontalMenuItemSelect: ({int selectedIndex}) {
                setState(() {
                  _selectedIndex = selectedIndex;
                });
                _verticalScroll.animateTo(
                  _initialVerticalPositions[selectedIndex] -
                      _initialVerticalPositions[0] +
                      1,
                  duration: Duration(
                      milliseconds:
                          widget.verticalScrollDurationInMilliseconds),
                  curve: Curves.linear,
                );
              },
            ),
            Expanded(
              child: VerticalSectionList(
                sections: widget.sections,
                controller: _verticalScroll,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Offset _getRenderBoxOffset({GlobalKey elementKey}) {
    final RenderBox renderBox = elementKey.currentContext.findRenderObject();
    return renderBox.localToGlobal(Offset.zero);
  }

  void _getVerticalPositions() {
    widget.sections.forEach((section) {
      _initialVerticalPositions
          .add(_getRenderBoxOffset(elementKey: section.sectionKey).distance);
    });
    print(_initialVerticalPositions);
  }

  void _getHorizontalPositions() {
    widget.sections.forEach((section) {
      _initialHorizontalPositions
          .add(_getRenderBoxOffset(elementKey: section.menuItemKey).distance);
    });
    print(_initialHorizontalPositions);
  }

  void _addVerticalScrollListeners() {
    for (var i = 0; i < widget.sections.length; i++) {
      if (i == 0) {
        if (_verticalScroll.offset <
                (_initialVerticalPositions[i + 1] -
                    _initialVerticalPositions[0]) &&
            _selectedIndex != i) {
          print('section $i');
          setState(() {
            _selectedIndex = i;
          });
          _scrollMenuHorizontally(index: i);
        }
      } else if (i == widget.sections.length - 1) {
        if (_verticalScroll.offset >
                (_initialVerticalPositions[i] - _initialVerticalPositions[0]) &&
            _selectedIndex != i) {
          print('section $i');
          setState(() {
            _selectedIndex = i;
          });
          _scrollMenuHorizontally(index: i);
        }
      } else {
        if (_verticalScroll.offset <
                (_initialVerticalPositions[i + 1] -
                    _initialVerticalPositions[0]) &&
            _verticalScroll.offset >
                (_initialVerticalPositions[i] - _initialVerticalPositions[0]) &&
            _selectedIndex != i) {
          print('section $i');
          setState(() {
            _selectedIndex = i;
          });
          _scrollMenuHorizontally(index: i);
        }
      }
    }
  }

  void _scrollMenuHorizontally({int index}) {
    int totalItems = widget.sections.length;
    int visibleItems = (widget.width / widget.menuItemWidth).floor();

    if (index == 0) {
      _horizontalScroll.animateTo(
        0.0,
        duration: Duration(
            milliseconds: widget.horizontalScrollDurationInMilliseconds),
        curve: Curves.linear,
      );
    } else if (index == totalItems - 1) {
      _horizontalScroll.animateTo(
        (totalItems * widget.menuItemWidth) - widget.width,
        duration: Duration(
            milliseconds: widget.horizontalScrollDurationInMilliseconds),
        curve: Curves.linear,
      );
    } else if (index + 1 > visibleItems) {
      _horizontalScroll.animateTo(
        widget.menuItemWidth * (index + 1 - visibleItems),
        duration: Duration(
            milliseconds: widget.horizontalScrollDurationInMilliseconds),
        curve: Curves.linear,
      );
    }
  }
}
