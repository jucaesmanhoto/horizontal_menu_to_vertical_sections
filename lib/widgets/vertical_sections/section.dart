import 'package:flutter/material.dart';

import '../../models/section_model.dart';

class Section extends StatelessWidget {
  const Section({
    Key? itemKey,
    required SectionModel section,

    // int sectionIndex,
    List<Widget> items = const [Text('Section')],
    Widget? sectionHeader,
    required double verticalContentPadding,
  })   : _section = section,
        _verticalContentPadding = verticalContentPadding,
        super(key: itemKey);

  final SectionModel _section;
  final double _verticalContentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: _section.sectionKey,
      contentPadding: EdgeInsets.all(_verticalContentPadding),
      title: Column(
        children: [
          _section.sectionHeader,
          ..._section.sectionItems,
        ],
      ),
    );
  }
}
