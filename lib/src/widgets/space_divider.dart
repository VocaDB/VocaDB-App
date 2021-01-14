import 'package:flutter/cupertino.dart';

/// An utility widget for add blank space with full width and given height
class SpaceDivider extends StatelessWidget {
  /// The height of space
  final double height;

  const SpaceDivider(this.height) : assert(height != null);

  const SpaceDivider.micro({this.height = 4.0});

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
