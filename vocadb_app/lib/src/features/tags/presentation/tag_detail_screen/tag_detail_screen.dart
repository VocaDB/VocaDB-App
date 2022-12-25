import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

// TODO : implement more UI detail
class TagDetailScreen extends StatelessWidget {
  const TagDetailScreen({super.key, required this.tagId});
  final String tagId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag Detail ID'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => {},
          ),
        ],
      ),
      body: const ResponsiveCenter(
        child: Text(
          'Tag Detail',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
