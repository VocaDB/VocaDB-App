import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';

// TODO : implement more UI detail
class TagDetailScreen extends StatelessWidget {
  const TagDetailScreen({super.key, required this.tagId});
  final String tagId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'Tag detail',
      ),
      body: ResponsiveCenter(
        child: Text(
          'Tag Detail',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
