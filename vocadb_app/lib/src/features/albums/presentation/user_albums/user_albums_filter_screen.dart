import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';

// TODO : need implementation
class UserAlbumsFilterScreen extends StatelessWidget {
  const UserAlbumsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveCenter(
        child: Text(
          'Filter My Collections',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
