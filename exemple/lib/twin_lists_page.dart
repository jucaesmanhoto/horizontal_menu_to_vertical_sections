import 'package:flutter/material.dart';
import 'package:horizontal_menu_to_vertical_sections/horizontal_menu_to_vertical_sections.dart';

import 'mocked_data.dart';

class TwinListsPage extends StatelessWidget {
  final ItemController verticalScrollController = ItemController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CombinedMenu(
        headerPadding: EdgeInsets.only(left: 12),
        baseLine: Container(
          height: 1,
          color: Colors.grey,
        ),
        verticalScrollController: verticalScrollController,
        items: items,
        keepAlive: double.maxFinite,
        selectedHeader: Container(
          padding: const EdgeInsets.only(left: 114.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
        ),
        headerHigth: kToolbarHeight,
      ),
    );
  }
}
