import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/blocs/config_bloc.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  buildThemeOptions(ConfigBloc configBloc) {
    return StreamBuilder(
      stream: configBloc.themeDataStream,
      builder: (context, snapshot) {
        ThemeEnum te = snapshot.data;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(FlutterI18n.translate(context, 'label.theme'),
                  style: Theme.of(this.context).textTheme.title),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio(
                value: ThemeEnum.Dark,
                groupValue: te,
                onChanged: configBloc.updateTheme,
              ),
            ),
            ListTile(
              title: const Text('Light'),
              leading: Radio(
                value: ThemeEnum.Light,
                groupValue: te,
                onChanged: configBloc.updateTheme,
              ),
            ),
          ],
        );
      },
    );
  }

  buildContentLang(ConfigBloc configBloc) {
    return StreamBuilder(
      stream: configBloc.contentLangStream,
      builder: (context, snapshot) {
        String value = snapshot.data;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  FlutterI18n.translate(context, 'label.contentLanguage'),
                  style: Theme.of(this.context).textTheme.title),
            ),
            ListTile(
              title: const Text('Original'),
              leading: Radio(
                value: 'Default',
                groupValue: value,
                onChanged: configBloc.updateContentLanguage,
              ),
            ),
            ListTile(
              title: const Text('English'),
              leading: Radio(
                value: 'English',
                groupValue: value,
                onChanged: configBloc.updateContentLanguage,
              ),
            ),
            ListTile(
              title: const Text('Romaji'),
              leading: Radio(
                value: 'Romaji',
                groupValue: value,
                onChanged: configBloc.updateContentLanguage,
              ),
            ),
            ListTile(
              title: const Text('Japanese'),
              leading: Radio(
                value: 'Japanese',
                groupValue: value,
                onChanged: configBloc.updateContentLanguage,
              ),
            ),
          ],
        );
      },
    );
  }

  buildUILanguage(ConfigBloc configBloc) {
    return StreamBuilder(
      stream: configBloc.uiLang$,
      builder: (context, snapshot) {
        String value = snapshot.data;

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(FlutterI18n.translate(context, 'label.uiLanguage'),
                  style: Theme.of(this.context).textTheme.title),
            ),
            ListTile(
              title: const Text('English'),
              leading: Radio(
                value: 'en',
                groupValue: value,
                onChanged: (String v) async {
                  await FlutterI18n.refresh(
                      context, Locale.fromSubtags(languageCode: v));
                  configBloc.updateUILanguage(v);
                },
              ),
            ),
            ListTile(
              title: const Text('日本語 (Japanese)'),
              leading: Radio(
                value: 'ja',
                groupValue: value,
                onChanged: (String v) async {
                  await FlutterI18n.refresh(
                      context, Locale.fromSubtags(languageCode: v));
                  configBloc.updateUILanguage(v);
                },
              ),
            ),
            ListTile(
              title: const Text('ไทย (Thai)'),
              leading: Radio(
                value: 'th',
                groupValue: value,
                onChanged: (String v) async {
                  await FlutterI18n.refresh(
                      context, Locale.fromSubtags(languageCode: v));
                  configBloc.updateUILanguage(v);
                },
              ),
            ),
            ListTile(
              title: const Text('Melayu (Malay)'),
              leading: Radio(
                value: 'ms',
                groupValue: value,
                onChanged: (String v) async {
                  await FlutterI18n.refresh(
                      context, Locale.fromSubtags(languageCode: v));
                  configBloc.updateUILanguage(v);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ConfigBloc configBloc = Provider.of<ConfigBloc>(context);

    return Scaffold(
      appBar:
          AppBar(title: Text(FlutterI18n.translate(context, 'label.settings'))),
      body: ListView(
        children: <Widget>[
          buildThemeOptions(configBloc),
          buildContentLang(configBloc),
          buildUILanguage(configBloc),
        ],
      ),
    );
  }
}
