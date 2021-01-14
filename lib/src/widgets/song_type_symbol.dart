import 'package:flutter/material.dart';

/// A widget that will return mini icon base on input song type
class SongTypeSymbol extends StatelessWidget {
  /// Song type string value
  final String songType;

  /// Song type map list
  static const Map _types = const {
    'Original': {'text': 'O', 'backgroundColor': Colors.lightBlue},
    'Remaster': {'text': 'R', 'backgroundColor': Colors.lightBlue},
    'Remix': {'text': 'R', 'backgroundColor': Colors.grey},
    'Cover': {'text': 'C', 'backgroundColor': Colors.lightBlue},
    'Instrumental': {'text': 'I', 'backgroundColor': Colors.lightBlue},
    'Mashup': {'text': 'M', 'backgroundColor': Colors.grey},
    'MusicPV': {'text': 'M', 'backgroundColor': Colors.green},
    'DramaPV': {'text': 'M', 'backgroundColor': Colors.green},
    'Arrangement': {'text': 'A', 'backgroundColor': Colors.grey},
  };

  const SongTypeSymbol({Key key, this.songType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map st =
        _types[this.songType] ?? {'text': 'O', 'backgroundColor': Colors.grey};

    return Container(
      child: Text(st['text'], style: TextStyle(color: Colors.white)),
      color: st['backgroundColor'],
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    );
  }
}
