import 'package:flutter/foundation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollableController with ChangeNotifier {
  int? _min;
  int? _max;

  final ValueNotifier<int> valueListenable = ValueNotifier(0);

  int get min => _min ?? 0;
  int get max => _max ?? 0;

  void updatePositions({
    required Iterable<ItemPosition> positions,
    required void Function({required int firstItem, required int lastItem})
        onValueChane,
  }) async {
    if (positions.isNotEmpty) {
      _min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;

      _max = positions
          .where((ItemPosition position) => position.itemLeadingEdge < 1)
          .reduce((ItemPosition max, ItemPosition position) =>
              position.itemLeadingEdge > max.itemLeadingEdge ? position : max)
          .index;
    }
    valueListenable.value = min;
    onValueChane(firstItem: min, lastItem: max);
    notifyListeners();
  }

  @override
  void dispose() {
    valueListenable.dispose();
    super.dispose();
  }
}
