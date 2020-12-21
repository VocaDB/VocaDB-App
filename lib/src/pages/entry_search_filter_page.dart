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
            TagInput(
              values: [TagModel(name: 'Jazz')],
              onAddPressed: () => {print('browse')},
              onDeleted: (deletedTagModel) =>
                  {print('delete ${deletedTagModel}')},
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
          ],
        ),
      ),
    );
  }
}
