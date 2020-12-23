import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventSearchFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: ListView(
          children: [
            SimpleDropdownInput.fromJsonArray(
              label: 'Category',
              value: 'Nothing',
              onChanged: (i) => {},
              json: [
                {'name': 'Not specified', 'value': 'Nothing'},
                {'name': 'Album release fair', 'value': 'AlbumReleaseFair'},
                {'name': 'Club', 'value': 'Club'},
                {'name': 'Contest', 'value': 'Contest'},
              ],
            ),
            SimpleDropdownInput.fromJsonArray(
              label: 'Sort',
              value: 'Name',
              onChanged: (i) => {},
              json: [
                {'name': 'Not specified', 'value': 'Nothing'},
                {'name': 'Name', 'value': 'Name'},
                {'name': 'Date', 'value': 'Date'},
              ],
            ),
            Divider(),
            DateRangeInput(
              onFromDateChanged: print,
              onToDateChanged: print,
            ),
            Divider(),
            ArtistInput(
              values: [ArtistModel(id: 1, name: 'Miku')],
              onAddPressed: () => {print('browse artist')},
              onDeleted: (deletedArtist) =>
                  {print('delete tag $deletedArtist')},
            ),
            Divider(),
            TagInput(
              values: [TagModel(name: 'Rock'), TagModel(name: 'Jazz')],
              onAddPressed: () => {print('browse tag')},
              onDeleted: (deletedTag) => {print('delete tag $deletedTag')},
            ),
          ],
        ));
  }
}
