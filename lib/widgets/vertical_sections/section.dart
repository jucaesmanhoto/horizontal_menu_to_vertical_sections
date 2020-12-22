import 'package:flutter/material.dart';

import 'section_model.dart';

class Section extends StatelessWidget {
  const Section({
    Key key,
    SectionModel section,
    GlobalKey itemKey,
    // int sectionIndex,
    List<Widget> items = const [Text('Section')],
    Widget sectionHeader,
  })  : _section = section,
        super(key: key);

  final SectionModel _section;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: _section.sectionKey,
      title: Column(
        children: [
          _section.sectionHeader,
          ..._section.sectionItems,
        ],
      ),
    );
  }
}
