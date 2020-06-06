import 'package:flutter/cupertino.dart';

class SpaceDivider extends StatelessWidget {
  final double height;

  const SpaceDivider.small({this.height = 16.0});

  const SpaceDivider.medium({this.height = 32.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: double.infinity,
    );
  }
}
