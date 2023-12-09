import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';

/// A widget that visible only for logged in user
class AuthenticatedWidget extends ConsumerWidget {
  const AuthenticatedWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    if (user == null) {
      return Container();
    }

    return child;
  }
}
