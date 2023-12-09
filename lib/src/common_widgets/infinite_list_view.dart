import 'package:flutter/material.dart';

/// A widget for display list of items and callback when user reach to bottom.
class InfiniteListView extends StatelessWidget {
  /// Number of item
  final int itemCount;

  /// A builder
  final IndexedWidgetBuilder itemBuilder;

  /// A callback function when user react to last item.
  final VoidCallback? onReachLastItem;

  /// A progress indicator widget for display next to the last item of list
  final Widget progressIndicator;

  /// A widget that will display when size is zero.
  final Widget emptyWidget;

  const InfiniteListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.progressIndicator = const SizedBox(),
    this.emptyWidget = const SizedBox(),
    this.onReachLastItem,
  });

  static Widget buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[CircularProgressIndicator()],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return emptyWidget;
    }

    return ListView.builder(
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index == itemCount) {
          if (onReachLastItem != null) {
            onReachLastItem!();
          }

          return progressIndicator;
        }

        return itemBuilder(context, index);
      },
    );
  }
}
