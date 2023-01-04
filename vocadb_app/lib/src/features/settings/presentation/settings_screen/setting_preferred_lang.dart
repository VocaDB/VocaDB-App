import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/simple_radio_group.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/utils/app_localizations_context.dart';

class SettingPreferredLang extends ConsumerWidget {
  const SettingPreferredLang({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(preferredStateChangesProvider);

    return AsyncValueWidget<String?>(
      value: value,
      data: (data) => SimpleRadioGroup(
        title: Text(context.loc.preferredDisplayLanguage),
        groupValue: data,
        onChanged: (value) {
          ref.read(userSettingsRepositoryProvider).savePreferredLang(value);
        },
        items: const [
          SimpleRadioItem(name: 'Original', value: 'Default'),
          SimpleRadioItem(name: 'English', value: 'English'),
          SimpleRadioItem(name: 'Romaji', value: 'Romaji'),
          SimpleRadioItem(name: 'Japanese', value: 'Japanese'),
        ],
      ),
    );
  }
}
