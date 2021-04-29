import 'package:flutter/material.dart';

import '../../models/section_model.dart';
import 'section.dart';

class VerticalSectionList extends StatelessWidget {
  const VerticalSectionList({
    Key? key,
    required List<SectionModel> sections,
    required ScrollController controller,
    required double verticalContentPadding,
  })   : _sections = sections,
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
        child: Column(
          children: _sections.map((section) {
            return Section(
              section: section,
              verticalContentPadding: _verticalContentPadding,
            );
          }).toList(),
        ),
      ),
    );
  }
}
