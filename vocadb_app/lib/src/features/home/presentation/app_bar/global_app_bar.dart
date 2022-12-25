import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  const GlobalAppBar({super.key, required this.title, this.displayHome = true});

  final String title;

  final bool displayHome;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoute.entriesSearch.name);
          },
        ),
        Visibility(
          visible: displayHome,
          child: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoute.home.name);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
