import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class FollowedArtistsScreen extends StatelessWidget {
  const FollowedArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followed artists'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context)
                  .goNamed(AppRoute.userFollowedArtistsFilter.name);
            },
          ),
        ],
      ),
      body: const ResponsiveCenter(
        child: Text(
          'Followed artists',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
