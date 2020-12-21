import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/widgets/tag_input.dart';
import 'package:vocadb_app/widgets.dart';

class SongSearchFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleDropdownInput.fromJsonArray(
              label: 'Song type',
              value: 'Nothing',
              onChanged: (i) => {},
              json: [
                {'name': 'Not specified', 'value': 'Nothing'},
                {'name': 'Original song', 'value': 'Original'},
                {'name': 'Remaster', 'value': 'Remaster'},
                {'name': 'Cover', 'value': 'Cover'},
              ],
            ),
            SimpleDropdownInput.fromJsonArray(
              label: 'Sort',
              value: 'Name',
              onChanged: (i) => {},
              json: [
                {'name': 'Not specified', 'value': 'Nothing'},
                {'name': 'Name', 'value': 'Name'},
                {'name': 'Addition date', 'value': 'AdditionDate'},
                {'name': 'Rating score', 'value': 'RAting'},
              ],
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
