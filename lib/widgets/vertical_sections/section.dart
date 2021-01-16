import 'package:flutter/material.dart';

import 'section_model.dart';

class Section extends StatefulWidget {
  Section({
    Key key,
    SectionModel section,
    // GlobalKey itemKey,
    // int sectionIndex,
    List<Widget> items = const [Text('Section')],
    Widget sectionHeader,
    double verticalContentPadding,
  })  : _section = section,
        _verticalContentPadding = verticalContentPadding,
        super(key: key);

  final SectionModel _section;
  final double _verticalContentPadding;

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  ScrollController _controller;
  String message = "";

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_sectionListeners);
  }

  void _sectionListeners() {
    print("reach the bottom");
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print("reach the bottom");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("reach the top");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3000,
      child: ListView(
        controller: _controller,
        // shrinkWrap: true,
        padding: EdgeInsets.all(0),
        children: [
          Container(
            height: 30,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.green,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.green,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.green,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            width: 200,
            color: Colors.green,
          ),
        ],
      ),
    );
    // ListTile(
    //   key: _section.sectionKey,

    //   contentPadding: EdgeInsets.all(_verticalContentPadding),
    //   title: Column(
    //     // shrinkWrap: true,
    //     children: [
    //       _section.sectionHeader,
    //       ..._section.sectionItems,
    //     ],
    //   ),
    // );
  }
}
