import 'package:flutter/material.dart';

/// A widget for wrap child widget with header and actions
class Section extends StatelessWidget {
  /// Title display on top of widget.
  final String title;

  /// List of action widgets display on top right side of header.
  final List<Widget> actions;

  /// The child contained by the section.
  final Widget child;

  /// A widget that will appended into the end of section.
  final Widget divider;

  final bool visible;

  /// Default header height
  static const double _headerHeight = 48;

  const Section(
      {Key key,
      @required this.title,
      this.actions,
      @required this.child,
      this.divider,
      this.visible = true})
      : assert(title != null),
        assert(child != null),
        super(key: key);

  Widget _headerBuilder(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: _headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(this.title),
          (actions == null || actions.isEmpty)
              ? Container()
              : Row(children: actions)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (visible == null || !visible) return Container();

    print('$title - $visible');

    List<Widget> children = [_headerBuilder(context), child];

    if (divider != null) {
      children.add(divider);
    }

    return Column(
      children: children,
    );
  }
}
