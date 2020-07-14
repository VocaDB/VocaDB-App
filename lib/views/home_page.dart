import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';
import 'package:vocadb/views/views.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VocaDB'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SpaceDivider.medium(),
            ShortcutMenus(),
            SongApiListView(
              tag: 'highlighted',
              title: SectionHeadText('Highlighted'),
              event: FetchHighlighted(),
            ),
          ],
        ),
      ),
    );
  }
}

class ShortcutMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.center,
        runSpacing: 24.0,
        children: <Widget>[
          ShortcutMenuButton(
              title: FlutterI18n.translate(context, 'label.songs'),
              iconData: Icons.music_note,
              onPressed: () => SongPage.navigate(context)),
        ],
      ),
    );
  }
}

class ShortcutMenuButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  const ShortcutMenuButton({Key key, this.title, this.iconData, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RawMaterialButton(
          onPressed: this.onPressed,
          child: Icon(
            iconData,
            color: Theme.of(context).iconTheme.color,
            size: 24.0,
          ),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(15.0),
        ),
        Text(title)
      ],
    );
  }
}
