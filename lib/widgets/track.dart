import 'package:flutter/material.dart';

class Track extends StatelessWidget {
  final int trackNumber;

  final String name;

  final String artist;

  const Track({Key key, this.trackNumber, this.name, this.artist})
      : super(key: key);

  factory Track.parseMap(Map<String, Object> map, {Key key}) {
    return Track(
        key: key,
        trackNumber: map['trackNumber'],
        name: map['name'],
        artist: 'Unknown artist');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(this.trackNumber.toString()),
      title: Text(this.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.artist, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}