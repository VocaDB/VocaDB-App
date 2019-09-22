import 'package:flutter/material.dart';
import 'package:vocadb/pages/main/highlighted_list.dart';
import 'package:vocadb/pages/main/latest_album_list.dart';
import 'package:vocadb/pages/main/top_album_list.dart';
import 'package:vocadb/pages/search/search_page.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
          HighlightedList(),
          LatestAlbumList(),
          TopAlbumList(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: Material(
        color: theme.cardColor,
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: theme.iconTheme.color)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
