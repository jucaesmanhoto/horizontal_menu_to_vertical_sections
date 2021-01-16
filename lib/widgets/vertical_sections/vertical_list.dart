import 'package:flutter/material.dart';

import 'section.dart';
import 'section_model.dart';

class VerticalSectionList extends StatelessWidget {
  const VerticalSectionList({
    Key key,
    List<SectionModel> sections,
    @required ScrollController controller,
    @required double verticalContentPadding,
  })  : _sections = sections,
        _controller = controller,
        _verticalContentPadding = verticalContentPadding,
        super(key: key);

  final ScrollController _controller;
  final List<SectionModel> _sections;
  final double _verticalContentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(children: [
          Section(),
          Container(
            height: 300,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 300,
            width: 200,
            color: Colors.blue,
          )
        ]
            // _sections.map((section) {
            //   return Section(
            //     section: section,
            //     verticalContentPadding: _verticalContentPadding,
            //   );
            // }).toList(),
            ),
      ),
    );
  }
}
