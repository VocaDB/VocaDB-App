import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Events'), actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Get.to(ReleaseEventSearchFilterPage()))
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ReleaseEventListView(
            events: [
              ReleaseEventModel(
                name: 'Magical mirai 2020',
                eventCategory: 'Contest',
                mainPicture: MainPictureModel(
                    urlThumb:
                        'https://static.vocadb.net/img/releaseevent/mainOrig/1426.jpg?v=19'),
              ),
              ReleaseEventModel(
                name: 'MAIKAs Birthday 2020',
                eventCategory: 'Anniversary',
                mainPicture: MainPictureModel(
                    urlThumb:
                        'https://static.vocadb.net/img/releaseeventseries/mainOrig/206.jpg?v=4'),
              ),
            ],
          ),
        ));
  }
}
