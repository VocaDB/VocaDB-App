import 'package:flutter/material.dart';

/// A widget that will return mini icon base on input song type
class SongTypeIcon extends StatelessWidget {
  /// Song type string value
  final String songType;

  /// Song type map list
  static const Map _types = {
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

  const SongTypeIcon({super.key, required this.songType});

  @override
  Widget build(BuildContext context) {
    Map st = _types[songType] ?? {'text': 'O', 'backgroundColor': Colors.grey};

    return Container(
      color: st['backgroundColor'],
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(st['text'], style: const TextStyle(color: Colors.white)),
    );
  }
}
