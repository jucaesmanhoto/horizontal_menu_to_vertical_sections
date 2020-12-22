import 'package:flutter/material.dart';
import 'package:horizontal_menu_to_vertical_sections/horizontal_menu_to_vertical_sections.dart';
import 'mocked_data.dart';

class TwinListsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CombinedMenu(
        sections: mockedSections,
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        width: MediaQuery.of(context).size.width,
        horizontalScrollDurationInMilliseconds: 100,
        verticalScrollDurationInMilliseconds: 300,
        baseLineColor: Colors.black26,
        inticatorColor: Colors.black,
        horizontalPadding: 16.0,
        indicatorWidthRelationFlex: 2,
        itemBaseLineWidthRelationFlex: 3,
      ),
    );
  }
}
