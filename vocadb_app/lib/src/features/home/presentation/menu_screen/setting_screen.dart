import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : need implementation
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'VocaDB',
      ),
      body: ResponsiveCenter(
        child: Text(
          'Setting',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
