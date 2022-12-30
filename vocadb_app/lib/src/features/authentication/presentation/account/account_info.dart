import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';

// TODO : need implementation
/// Simple user data table showing the uid and email
class AccountInfo extends ConsumerWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme.subtitle2!;
    final user = ref.watch(authStateChangesProvider).value;
    return Column(
      children: [
        gapH16,
        SizedBox(
          width: 120,
          height: 120,
          child: ClipOval(
            child: Container(
              color: Colors.white,
              child: const CustomNetworkImage(
                kPlaceholderImageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        gapH16,
        Text(
          user!.name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
