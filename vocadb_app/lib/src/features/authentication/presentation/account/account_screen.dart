import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/alert_dialogs.dart';
import 'package:vocadb_app/src/common_widgets/responsive_center.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/authentication/presentation/account/account_info.dart';
import 'package:vocadb_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:vocadb_app/src/localization/string_hardcoded.dart';
import 'package:vocadb_app/src/utils/async_value_ui.dart';

// TODO : need cleanup UI detail
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      accountScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(accountScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: state.isLoading
            ? const CircularProgressIndicator()
            : Text('Account'.hardcoded),
      ),
      body: ResponsiveCenter(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Column(children: [
          const AccountInfo(),
          gapH16,
          ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () async {
                    final logout = await showAlertDialog(
                      context: context,
                      title: 'Are you sure?'.hardcoded,
                      cancelActionText: 'Cancel'.hardcoded,
                      defaultActionText: 'Logout'.hardcoded,
                    );
                    if (logout == true) {
                      ref
                          .read(accountScreenControllerProvider.notifier)
                          .signOut();
                    }
                  },
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text('Sign out'),
          ),
        ]),
      ),
    );
  }
}
