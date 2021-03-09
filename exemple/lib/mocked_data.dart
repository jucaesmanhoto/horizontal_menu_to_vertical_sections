import 'package:flutter/material.dart';
import 'package:horizontal_menu_to_vertical_sections/widgets/vertical_sections/section_model.dart';

List<Color> colors = [
  Colors.amber,
  Colors.blue,
  Colors.cyan,
  Colors.yellow,
  Colors.purpleAccent[100],
  Colors.lime,
  Colors.brown[300],
  Colors.green[300],
  Colors.orange[600],
  Colors.red[300],
  Colors.teal,
];

List<SectionModel> mockedSections = List.generate(
    10,
    (index) => SectionModel(
          sectionIndex: index,
          sectionHeader: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: colors[(index + 5) % colors.length],
                width: 2.0,
              ),
              color: colors[(index + 3) % colors.length],
            ),
            child: Center(
              child: Text('Section $index'),
            ),
          ),
          horizontalMenuTitle: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: colors[index % colors.length],
            ),
            child: Text(
              'Section $index',
              style: TextStyle(color: Colors.black26),
            ),
          ),
          horizontalSelectedMenuTitle: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            child: Text(
              'Section $index',
            ),
          ),
          sectionItems: List.generate(
            10,
            (index) => Container(
              padding: const EdgeInsets.all(16.0),
              color: colors[index % colors.length],
              child: Center(child: Text('Item $index')),
            ),
          ),
        ));
