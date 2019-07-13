import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

import 'song_detail_content.dart';

class SongDetailPage extends StatefulWidget {
  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {

  WebController webController;

  FlutterNativeWeb flutterWebView;

  @override
  void initState() {
    super.initState();
    flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
    );
  }

  void onWebCreated(webController) {
    this.webController = webController;

    // Youtube
    String url = 'https://www.youtube.com/embed/PqJNc9KVIZE?playsinline=1';

    // Soundcloud
//    String url = 'https://w.soundcloud.com/player/?url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F634499643&auto_play=false&show_artwork=true&color=ff7700';

    // BB
//    String url = '"https://player.bilibili.com/player.html?aid=52990237&cid=92711286&page=1';

    this.webController.loadUrl(url);

    this.webController.onPageStarted.listen((url) =>
        print("Loading $url")
    );
    this.webController.onPageFinished.listen((url) =>
        print("Finished loading $url")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          new Container(
            key: UniqueKey(),
          child: flutterWebView,
            height: 200,
            width: double.infinity,
          ),
          Expanded(
            child: SongDetailContent(),
          ),

        ],
      ),
    );
  }
}

class MediaPreview extends StatelessWidget {
  const MediaPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      width: double.infinity,
      color: Colors.blue,
      child: Text('Image or video')
    );
  }
}
