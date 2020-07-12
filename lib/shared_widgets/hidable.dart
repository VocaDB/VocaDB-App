import 'package:flutter/material.dart';

class Hidable extends StatelessWidget {
  final bool condition;

  final Widget child;

  const Hidable({this.condition, this.child})
      : assert(condition != null && child != null);

  @override
  Widget build(BuildContext context) {
    return (this.condition) ? this.child : Container();
  }
}
