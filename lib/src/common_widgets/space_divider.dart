import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';

/// An utility widget for add blank space with full width and given height
class SpaceDivider extends StatelessWidget {
  /// The height of space
  final double height;

  const SpaceDivider(this.height, {super.key});

  const SpaceDivider.micro({super.key, this.height = Sizes.p4});

  const SpaceDivider.small({super.key, this.height = Sizes.p16});

  const SpaceDivider.medium({super.key, this.height = Sizes.p32});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
    );
  }
}
