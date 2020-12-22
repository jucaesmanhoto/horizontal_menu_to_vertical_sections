import 'package:flutter/material.dart';
import 'package:horizontal_menu_to_vertical_sections/widgets/vertical_sections/section_model.dart';

List<Widget> mockedItems = [
  Container(
    height: 80.0,
    child: Text('Item 1'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 2'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 3'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 4'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 5'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 6'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 7'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 8'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 9'),
  ),
  Container(
    height: 80.0,
    child: Text('Item 10'),
  ),
];

List<SectionModel> mockedSections = [
  SectionModel(
    sectionIndex: 0,
    sectionHeader: Text('Section 0'),
    horizontalMenuTitle: Text('Section 0'),
    sectionItems: mockedItems,
  ),
  SectionModel(
    sectionIndex: 1,
    sectionHeader: Text('Section 1'),
    horizontalMenuTitle: Text('Section 1'),
    sectionItems: mockedItems,
  ),
  SectionModel(
    sectionIndex: 2,
    sectionHeader: Text('Section 2'),
    horizontalMenuTitle: Text('Section 2'),
    sectionItems: mockedItems,
  ),
  SectionModel(
    sectionIndex: 3,
    sectionHeader: Text('Section 3'),
    horizontalMenuTitle: Text('Section 3'),
    sectionItems: mockedItems,
  ),
  // SectionModel(
  //   sectionIndex: 4,
  //   sectionHeader: Text('Section 4'),
  //   horizontalMenuTitle: Text('Section 4'),
  //   sectionItems: mockedItems,
  // ),
  // SectionModel(
  //   sectionIndex: 5,
  //   sectionHeader: Text('Section 5'),
  //   horizontalMenuTitle: Text('Section 5'),
  //   sectionItems: mockedItems,
  // ),
  // SectionModel(
  //   sectionIndex: 6,
  //   sectionHeader: Text('Section 6'),
  //   horizontalMenuTitle: Text('Section 6'),
  //   sectionItems: mockedItems,
  // ),
  // SectionModel(
  //   sectionIndex: 7,
  //   sectionHeader: Text('Section 7'),
  //   horizontalMenuTitle: Text('Section 7'),
  //   sectionItems: mockedItems,
  // ),
  // SectionModel(
  //   sectionIndex: 8,
  //   sectionHeader: Text('Section 8'),
  //   horizontalMenuTitle: Text('Section 8'),
  //   sectionItems: mockedItems,
  // ),
  // SectionModel(
  //   sectionIndex: 9,
  //   sectionHeader: Text('Section 9'),
  //   horizontalMenuTitle: Text('Section 9'),
  //   sectionItems: mockedItems,
  // ),
];
