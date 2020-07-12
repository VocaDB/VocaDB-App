import 'package:flutter/material.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';

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
