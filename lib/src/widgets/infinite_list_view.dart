import 'package:flutter/material.dart';

/// A widget for display list of items and callback when user reach to bottom.
class InfiniteListView extends StatelessWidget {
  /// Number of item
  final int itemCount;

  /// A builder
  final IndexedWidgetBuilder itemBuilder;

  /// A callback function when user react to last item.
  final Function onReachLastItem;

  /// A progress indicator widget for display next to the last item of list
  final Widget progressIndicator;

  /// A widget that will display when size is zero.
  final Widget emptyWidget;

  const InfiniteListView(
      {Key key,
      this.itemCount,
      this.itemBuilder,
      this.onReachLastItem,
      this.emptyWidget,
      this.progressIndicator})
      : super(key: key);

  static Widget buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator()],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return (this.emptyWidget == null) ? Container() : this.emptyWidget;
    }

    return ListView.builder(
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index == itemCount) {
          if (this.onReachLastItem != null) this.onReachLastItem();

          return (progressIndicator == null) ? Container() : progressIndicator;
        }

        return itemBuilder(context, index);
      },
    );
  }
}
