import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandableContent extends StatefulWidget {
  final Widget child;

  const ExpandableContent({Key key, this.child}) : super(key: key);

  @override
  _ExpandableContentState createState() => _ExpandableContentState();
}

class _ExpandableContentState extends State<ExpandableContent> {
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }

  void open() {
    setState(() {
      expanded = true;
    });
  }

  void close() {
    setState(() {
      expanded = false;
    });
  }

  Widget buildHide() {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: open,
        child: Text('showMore'.tr),
      ),
    );
  }

  Widget buildShow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.child,
        Container(
          width: double.infinity,
          child: FlatButton(
            onPressed: close,
            child: Text('hide'.tr),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      transitionBuilder: (widget, animation) => SizeTransition(
        child: widget,
        sizeFactor: animation,
      ),
      child: (this.expanded) ? buildShow() : buildHide(),
    );
  }
}
