import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar(
      {super.key, required this.title, this.displayHome = true, this.actions});

  final Widget title;

  final bool displayHome;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
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
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
