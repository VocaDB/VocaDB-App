import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class RatedSongsScreen extends StatelessWidget {
  const RatedSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rated Songs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoute.userRatedSongFilter.name);
            },
          ),
        ],
      ),
      body: const ResponsiveCenter(
        child: Text(
          'Rated songs',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
