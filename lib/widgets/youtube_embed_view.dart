import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeEmbedView extends StatelessWidget {
  final String videoId;

  const YoutubeEmbedView({Key key, this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: WebView(
        initialUrl: 'https://www.youtube.com/embed/$videoId?playsinline=1',
        javascriptMode: JavascriptMode.unrestricted,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      ),
    );
  }
}
