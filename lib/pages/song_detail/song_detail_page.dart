import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'dart:io';
import 'song_detail_content.dart';

class SongDetailPage extends StatefulWidget {

  final String thumbUrl;

  final String tag;

  const SongDetailPage({Key key, this.thumbUrl, this.tag}) : super(key: key);

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
          child: (Platform.isAndroid)? flutterWebView : HeroContent(tag: widget.tag, thumbUrl: widget.thumbUrl),
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
      width: double.infinity,
      color: Colors.blue,
      child: Text('Image or video')
    );
  }
}


class HeroContent extends StatelessWidget {

  final String tag;

  final String thumbUrl;

  const HeroContent({Key key, this.tag, this.thumbUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.tag,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          height: 150,
          child: Image.network(
            this.thumbUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}