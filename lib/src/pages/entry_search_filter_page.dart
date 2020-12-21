import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class EntrySearchFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleDropdownInput.fromJsonArray(
              [
                {'name': 'Anything', 'value': 'Nothing'},
                {'name': 'Artist', 'value': 'Artist'},
                {'name': 'Album', 'value': 'Album'},
                {'name': 'Song', 'value': 'Song'},
                {'name': 'Tag', 'value': 'Tag'},
                {'name': 'Event', 'value': 'Event'}
              ],
              label: 'Type',
              value: 'Nothing',
              onChanged: (i) => {},
            ),
            SimpleDropdownInput.fromJsonArray(
              [
                {'name': 'Name', 'value': 'Name'},
                {'name': 'Addition date', 'value': 'AdditionDate'}
              ],
              label: 'Sort',
              value: 'Name',
              onChanged: (i) => {},
            ),
            TagInput(
              values: [TagModel(name: 'Jazz')],
              onAddPressed: () => {print('browse')},
              onDeleted: (deletedTagModel) =>
                  {print('delete ${deletedTagModel}')},
            ),
          ],
        ),
      ),
    );
  }
}
