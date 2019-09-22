import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/providers/global_provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final configBloc = GlobalProvider.of(context).configBloc;

    return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: StreamBuilder(
        stream: configBloc.themeDataStream,
        builder: (context, snapshot) {
          ThemeEnum te = snapshot.data;

          return ListView(
            children: <Widget>[
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
      ),
    );
  }
}
