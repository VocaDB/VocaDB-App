import 'package:flutter/material.dart';
import 'package:vocadb/widgets/center_content.dart';

class InfiniteListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function onReachLastItem;
  final Widget progressIndicator;

  const InfiniteListView(
      {Key key,
      this.itemCount,
      this.itemBuilder,
      this.onReachLastItem,
      this.progressIndicator})
      : super(key: key);

  static Widget buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[CircularProgressIndicator()],
    );
  }

  static Widget streamShowProgressIndicator(Stream stream) {
    return StreamBuilder(
      stream: stream,
      initialData: false,
      builder: (context, snapshot) => (snapshot.hasData && snapshot.data)
          ? Container()
          : buildProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return CenterResult.error(
        title: 'No results',
      );
    }

    return ListView.builder(
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index == itemCount) {
          this.onReachLastItem();

          return (progressIndicator == null) ? Container() : progressIndicator;
        }

        return itemBuilder(context, index);
      },
    );
  }
}
