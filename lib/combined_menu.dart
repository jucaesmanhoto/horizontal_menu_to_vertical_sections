import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'scrollable_controller.dart';

const scrollDuration = Duration(seconds: 2);

//Deve receber duas listas de widgets, uma lista de items do cabeçalhos e outra lista com os items do do corpo
//A lista do cabeçalho e a lista widgets devem ter o mesmo tamanho

class CombinedMenu extends StatefulWidget {
  final List<Widget> headers;
  final List<Widget> contents;
  final double headerHigth;
  final Widget selectedHeader;

  const CombinedMenu({
    required this.headerHigth,
    required this.selectedHeader,
    required this.headers,
    required this.contents,
  }) : assert(
          headers.length == contents.length,
          "The number of index needs to be the same of contents",
        );

  @override
  _CombinedMenuState createState() => _CombinedMenuState();
}

class _CombinedMenuState extends State<CombinedMenu> {
  final ScrollableController scrollableController = new ScrollableController();

  final rowScrollController = ScrollController();

  /// Controller to scroll or jump to a particular item.
  final ItemScrollController verticalScrollController = ItemScrollController();
  final ItemScrollController horizontalScrollController =
      ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener verticalItemPositionsListener =
      ItemPositionsListener.create();
  final ItemPositionsListener horizontalItemPositionsListener =
      ItemPositionsListener.create();

  int currentIndex = 0;

  void onPositionsChange({
    required int firstItem,
    required int lastItem,
  }) {
    if (currentIndex != firstItem) {
      currentIndex = firstItem;
      if (canUpdate()) {
        horizontalScrollController.jumpTo(
          index: currentIndex,
        );
      }
    }
  }

  bool canUpdate() {
    int min = 0;
    int max = 0;
    final positions = horizontalItemPositionsListener.itemPositions.value;
    if (horizontalItemPositionsListener.itemPositions.value.isNotEmpty) {
      min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;

      max = positions
          .where((ItemPosition position) => position.itemLeadingEdge < 1)
          .reduce((ItemPosition max, ItemPosition position) =>
              position.itemLeadingEdge > max.itemLeadingEdge ? position : max)
          .index;
    }
    if (currentIndex >= min && currentIndex <= max) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    this.scrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Iterable<ItemPosition>>(
      valueListenable: verticalItemPositionsListener.itemPositions,
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: widget.headerHigth,
              child: ValueListenableBuilder<int>(
                  valueListenable: scrollableController.valueListenable,
                  builder: (context, snapshot, child) {
                    return HeaderList(
                      controller: scrollableController,
                      numberOfItems: widget.contents.length,
                      itemPositionsListener: horizontalItemPositionsListener,
                      itemScrollController: horizontalScrollController,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Column(
                            children: [
                              widget.headers[index],
                              if (index == snapshot) this.widget.selectedHeader,
                            ],
                          ),
                          // child: index == snapshot
                          //     ? this.widget.selectedHeader
                          //     : this.widget.headers[index],
                          onTap: () => scrollTo(index),
                        );
                      },
                    );
                  }),
            ),
            BodyList(
              numberOfItems: widget.contents.length,
              itemPositionsListener: verticalItemPositionsListener,
              itemScrollController: verticalScrollController,
              itemBuilder: (context, index) {
                return widget.contents[index];
              },
            ),
          ],
        ),
      ),
      builder: (context, positions, child) {
        scrollableController.updatePositions(
          positions: positions,
          onValueChane: onPositionsChange,
        );
        return child!;
      },
    );
  }

  void scrollTo(int index) => verticalScrollController.scrollTo(
        index: index,
        duration: scrollDuration,
        curve: Curves.easeInOutCubic,
      );
}

class HeaderList extends StatelessWidget {
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  final IndexedWidgetBuilder itemBuilder;
  final int numberOfItems;
  final ScrollableController controller;

  HeaderList({
    Key? key,
    required this.itemBuilder,
    required this.controller,
    required this.itemScrollController,
    required this.itemPositionsListener,
    required this.numberOfItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScrollablePositionedList.builder(
        itemCount: numberOfItems,
        scrollDirection: Axis.horizontal,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        physics: RangeMaintainingScrollPhysics(),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class BodyList extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  final int numberOfItems;

  const BodyList({
    Key? key,
    required this.itemBuilder,
    required this.numberOfItems,
    required this.itemScrollController,
    required this.itemPositionsListener,
  }) : super(key: key);

  @override
  State<BodyList> createState() => _BodyListState();
}

class _BodyListState extends State<BodyList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollablePositionedList.builder(
        initialAlignment: 12,
        itemCount: widget.numberOfItems,
        itemScrollController: widget.itemScrollController,
        itemPositionsListener: widget.itemPositionsListener,
        physics: BouncingScrollPhysics(),
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
