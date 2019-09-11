import 'package:flutter/material.dart';
import 'package:vocadb/models/song.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';

class HighlightedList extends StatefulWidget {
  @override
  _HighlightedListState createState() => _HighlightedListState();
}

class _HighlightedListState extends State<HighlightedList> {

  List<SongCard> highlightedSongs;

  List<Song> _songs = List<Song>(); 

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    WebService().load(Song.all).then((songs) => {
      setState(() => {
        _songs = songs
      })
    });
  }

  List<Widget> _buildSongCardList() {
    return _songs.map((song) => SongCard.song(song)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
              title: 'Highlighted',
              horizontal: true,
              children: _buildSongCardList()
    );
  }
}
