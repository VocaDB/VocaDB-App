import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: EntryListView(
          entries: [
            EntryModel(
                name: 'spirit photo',
                artistString: 'Kirishima feat. Hatsune Miku',
                mainPicture: MainPictureModel(
                    urlThumb: 'https://i.ytimg.com/vi/6OAd30ljny8/default.jpg'),
                songType: 'Original',
                entryType: EntryType.Song),
            EntryModel(
                name: '初音ミク',
                mainPicture: MainPictureModel(
                    urlThumb:
                        'https://static.vocadb.net/img/artist/mainThumb/1.png?v=23'),
                entryType: EntryType.Artist),
            EntryModel(
                name: 'Deep Reflection',
                artistString: 'Clean Tears, S.C.X feat. 初音ミク',
                mainPicture: MainPictureModel(
                    urlThumb:
                        'https://static.vocadb.net/img/album/mainThumb/23864.jpg?v=10'),
                entryType: EntryType.Album),
            EntryModel(name: 'Rock', entryType: EntryType.Tag),
            EntryModel(
              name: 'Magical mirai 2020',
              eventCategory: 'Contest',
              mainPicture: MainPictureModel(
                  urlThumb:
                      'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=19'),
              entryType: EntryType.ReleaseEvent,
            ),
            EntryModel(
              name: 'MAIKAs Birthday 2020',
              eventCategory: 'Anniversary',
              mainPicture: MainPictureModel(
                  urlThumb:
                      'https://static.vocadb.net/img/releaseeventseries/mainOrig/206.jpg?v=4'),
              entryType: EntryType.ReleaseEvent,
            )
          ],
        ));
  }
}
