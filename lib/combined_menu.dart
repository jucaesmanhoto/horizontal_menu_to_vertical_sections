import 'package:flutter/material.dart';
import 'package:horizontal_menu_to_vertical_sections/combined_item_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'scrollable_controller.dart';

class CombinedMenu extends StatefulWidget {
  final List<CombinedItem> items;

  final double headerHigth;
  final EdgeInsets? headerPadding;
  final Widget selectedHeader;
  final Widget? baseLine;
  final Duration scrollDuration;
  final double? keepAlive;
  final ItemScrollController verticalScrollController;

  const CombinedMenu({
    this.scrollDuration = const Duration(seconds: 2),
    required this.verticalScrollController,
    required this.headerHigth,
    this.headerPadding,
    this.baseLine,
    required this.keepAlive,
    required this.selectedHeader,
    required this.items,
  });

  @override
  _CombinedMenuState createState() => _CombinedMenuState();
}

class _CombinedMenuState extends State<CombinedMenu> {
  final ScrollableController scrollableController = new ScrollableController();

  final rowScrollController = ScrollController();

  /// Controller to scroll or jump to a particular item.
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
    final headers = widget.items.map((i) => i.header).toList();
    final selectedHeaders = widget.items.map((i) => i.headerSelected).toList();
    final contents = widget.items.map((i) => i.body).toList();
    return ValueListenableBuilder<Iterable<ItemPosition>>(
      valueListenable: verticalItemPositionsListener.itemPositions,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: widget.headerHigth,
            child: ValueListenableBuilder<int>(
                valueListenable: scrollableController.valueListenable,
                builder: (context, snapshot, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: widget.headerPadding,
                        child: HeaderList(
                          controller: scrollableController,
                          numberOfItems: widget.items.length,
                          itemPositionsListener:
                              horizontalItemPositionsListener,
                          itemScrollController: horizontalScrollController,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Column(
                                children: [
                                  if (index == snapshot)
                                    selectedHeaders[index] ?? headers[index]
                                  else
                                    headers[index],
                                  if (index == snapshot) widget.selectedHeader,
                                ],
                              ),
                              onTap: () => scrollTo(index),
                            );
                          },
                        ),
                      ),
                      if (widget.baseLine != null)
                        Align(
                            child: widget.baseLine!,
                            alignment: AlignmentDirectional.bottomEnd),
                    ],
                  );
                }),
          ),
          BodyList(
            numberOfItems: contents.length,
            itemPositionsListener: verticalItemPositionsListener,
            itemScrollController: widget.verticalScrollController,
            keepAlive: widget.keepAlive,
            itemBuilder: (context, index) {
              return CustomScrollView(
                  shrinkWrap: true,
                  primary: false,
                  slivers: [
                    SliverToBoxAdapter(
                      child: contents[index],
                    )
                  ]);
              // return contents[index];
            },
          ),
        ],
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

  void scrollTo(int index) => widget.verticalScrollController.scrollTo(
        index: index,
        duration: widget.scrollDuration,
        curve: Curves.easeInOutCubic,
      );
  void jumpTo(int index) => widget.verticalScrollController.jumpTo(
        index: index,
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
        shrinkWrap: true,
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
  final double? keepAlive;

  const BodyList({
    Key? key,
    required this.itemBuilder,
    this.keepAlive,
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
        addAutomaticKeepAlives: true,
        minCacheExtent: widget.keepAlive,
        itemCount: widget.numberOfItems,
        itemScrollController: widget.itemScrollController,
        itemPositionsListener: widget.itemPositionsListener,
        physics: BouncingScrollPhysics(),
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
