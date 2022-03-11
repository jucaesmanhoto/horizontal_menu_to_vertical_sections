import 'package:flutter/material.dart';
import 'package:horizontal_menu_to_vertical_sections/horizontal_menu_to_vertical_sections.dart';

List<Color> colors = [
  Colors.amber,
  Colors.blue,
  Colors.cyan,
  Colors.yellow,
  Colors.purpleAccent[100]!,
  Colors.lime,
  Colors.brown[300]!,
  Colors.green[300]!,
  Colors.orange[600]!,
  Colors.red[300]!,
  Colors.teal,
];

List<CombinedItem> items = List<CombinedItem>.generate(
  10,
  (index) {
    return CombinedItem(
      header: SizedBox(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colors[index % colors.length],
            ),
            padding: const EdgeInsets.all(6.0),
            child: Text('Item $index'),
          ),
        ),
      ),
      body: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              margin: const EdgeInsets.all(4.0),
              height: 399,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
              ),
              child: Text(
                'Section $index',
                style: TextStyle(color: Colors.black26),
              ),
            )
          ],
          addAutomaticKeepAlives: true,
        ),
      ),
    );
  },
);
