import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/common_widgets/simple_radio_group.dart';
import 'package:vocadb_app/src/features/settings/data/user_settings_repository.dart';
import 'package:vocadb_app/src/utils/app_localizations_context.dart';

class SettingInterfaceLang extends ConsumerWidget {
  const SettingInterfaceLang({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(interfaceLangStateChangesProvider);

    return AsyncValueWidget(
      value: value,
      data: (data) => SimpleRadioGroup(
        title: Text(context.loc.interfaceLanguage),
        groupValue: data,
        onChanged: (value) {
          ref.read(userSettingsRepositoryProvider).saveInterfaceLang(value!);
        },
        items: const [
          SimpleRadioItem(name: 'English', value: 'en'),
          SimpleRadioItem(name: '日本語 (Japanese)', value: 'ja'),
          SimpleRadioItem(name: 'ไทย (Thai)', value: 'th'),
          SimpleRadioItem(name: 'Melayu (Malay)', value: 'ms'),
          SimpleRadioItem(name: '中文 (Chinese)', value: 'zh'),
        ],
      ),
    );
  }
}
