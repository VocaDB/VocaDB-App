import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String thumbUrl;

  final String tag;

  const EventDetailPage({Key key, this.thumbUrl, this.tag}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {

  List<Widget> buildContent() {
    return [
      Text('Expansion panel')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Sample event"),
                background: Hero(tag: widget.tag, child: Image.network(widget.thumbUrl)),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(buildContent()),
            )
          ],
        ),
      ),
    );
  }
}