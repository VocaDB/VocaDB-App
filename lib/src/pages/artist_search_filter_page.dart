import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class ArtistSearchFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleDropdownInput.fromJsonArray(
                json: [
                  {'name': 'Not specified', 'value': 'Nothing'},
                  {'name': 'Circle', 'value': 'Circle'},
                  {'name': 'Vocaloid', 'value': 'Vocaloid'},
                ],
                label: 'Artist type',
                value: 'Nothing',
                onChanged: (i) => {},
              ),
              SimpleDropdownInput.fromJsonArray(
                json: [
                  {'name': 'Name', 'value': 'Name'},
                  {'name': 'Addition date', 'value': 'AdditionDate'}
                ],
                label: 'Sort',
                value: 'Name',
                onChanged: (i) => {},
              ),
              Divider(),
              TagInput(
                values: [TagModel(name: 'Jazz')],
                onSelect: (value) => {},
                onDeleted: (deletedTagModel) =>
                    {print('delete ${deletedTagModel}')},
              ),
            ],
          ),
        ));
  }
}
