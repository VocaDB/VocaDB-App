import 'package:flutter/material.dart';

class FullWidth extends StatelessWidget {
  final Widget child;

  const FullWidth({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: this.child,
    );
  }
}
