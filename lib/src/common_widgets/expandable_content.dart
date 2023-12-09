import 'package:flutter/material.dart';

class ExpandableContent extends StatefulWidget {
  const ExpandableContent({super.key, required this.child});

  final Widget child;

  @override
  State<ExpandableContent> createState() => _ExpandableContentState();
}

class _ExpandableContentState extends State<ExpandableContent> {
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }

  void _open() {
    setState(() {
      expanded = true;
    });
  }

  void _close() {
    setState(() {
      expanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (widget, animation) => SizeTransition(
        sizeFactor: animation,
        child: widget,
      ),
      child: (expanded)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.child,
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _close,
                    child: const Text('Hide'),
                  ),
                ),
              ],
            )
          : SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _open,
                child: const Text('More'),
              ),
            ),
    );
  }
}
