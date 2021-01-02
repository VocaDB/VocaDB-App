import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class AlbumSearchFilterPage extends StatelessWidget {
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
                  {'name': 'Original album', 'value': 'Original'},
                  {'name': 'Single', 'value': 'Single'},
                ],
                label: 'Album type',
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
              ArtistInput(
                values: [ArtistModel(id: 1, name: 'Miku')],
                onSelect: (artistModel) => {print('browse artist')},
                onDeleted: (deletedArtist) =>
                    {print('delete tag $deletedArtist')},
              ),
              Divider(),
              TagInput(
                values: [TagModel(name: 'Jazz')],
                onAddPressed: () => {print('browse')},
                onDeleted: (deletedTagModel) =>
                    {print('delete ${deletedTagModel}')},
              ),
            ],
          ),
        ));
  }
}
