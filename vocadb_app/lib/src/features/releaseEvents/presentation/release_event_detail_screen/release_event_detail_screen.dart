import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : need implementation
class ReleaseEventDetailScreen extends StatelessWidget {
  const ReleaseEventDetailScreen({super.key, required this.releaseEventId});
  final String releaseEventId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'Release event detail',
      ),
      body: ResponsiveCenter(
        child: Text(
          'Release event detail',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
