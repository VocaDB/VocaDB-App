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
      {super.key,
      required this.title,
      required this.child,
      this.actions = const [],
      this.divider = const SizedBox(),
      this.visible = true});

  Widget _headerBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: _headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          (actions.isEmpty) ? Container() : Row(children: actions)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!visible) return Container();

    List<Widget> children = [_headerBuilder(context), child];

    children.add(divider);

    return Column(
      children: children,
    );
  }
}
