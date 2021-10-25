import 'package:flutter/material.dart';

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

List<Widget> mockedHeaders = List<Widget>.generate(
  10,
  (index) => ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 20),
    child: SizedBox(
      height: 20,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors[index % colors.length],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Text('Item $index'),
        ),
      ),
    ),
  ),
);

List<Widget> mockedContents = List<Widget>.generate(
  10,
  (index) => Container(
    padding: const EdgeInsets.all(4.0),
    height: 399,
    decoration: BoxDecoration(
      color: colors[index % colors.length],
    ),
    child: Text(
      'Section $index',
      style: TextStyle(color: Colors.black26),
    ),
  ),
);
