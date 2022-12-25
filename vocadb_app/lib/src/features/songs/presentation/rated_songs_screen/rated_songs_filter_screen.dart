import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

// TODO : need implementation
class RatedSongsFilterScreen extends StatelessWidget {
  const RatedSongsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveCenter(
        child: Text(
          'Filter Rated songs',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
