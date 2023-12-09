import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/flavor_config.dart';

class AppTitle extends ConsumerWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.read(flavorConfigProvider);
    return Text(config.appTitle);
  }
}
