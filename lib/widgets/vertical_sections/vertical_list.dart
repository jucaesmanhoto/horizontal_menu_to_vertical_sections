import 'package:flutter/material.dart';

import 'section.dart';
import 'section_model.dart';

class VerticalSectionList extends StatelessWidget {
  const VerticalSectionList({
    Key key,
    List<SectionModel> sections,
    @required ScrollController controller,
  })  : _sections = sections,
        _controller = controller,
        super(key: key);

  final ScrollController _controller;
  final List<SectionModel> _sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: _sections.map((section) {
            return Section(
              section: section,
            );
          }).toList(),
        ),
      ),
    );
  }
}
