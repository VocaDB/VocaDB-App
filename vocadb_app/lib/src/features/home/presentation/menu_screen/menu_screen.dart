import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveCenter(
        child: Text(
          'Menu',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
