import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

// TODO : need implementation
class FollowedArtistsFilterScreen extends StatelessWidget {
  const FollowedArtistsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveCenter(
        child: Text(
          'Followed artists filter',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
