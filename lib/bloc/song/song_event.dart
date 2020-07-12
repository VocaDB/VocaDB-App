import 'package:equatable/equatable.dart';

abstract class SongEvent extends Equatable {
  const SongEvent();
}

class FetchSongs extends SongEvent {
  final String query;
  final String lang;

  const FetchSongs({this.query, this.lang});

  @override
  List<Object> get props => [];
}

class FetchHighlighted extends SongEvent {
  final String lang;

  const FetchHighlighted({this.lang});

  @override
  List<Object> get props => [lang];
}

class FetchSongDetail extends SongEvent {
  final int id;
  final String lang;

  const FetchSongDetail(this.id, {this.lang});

  @override
  List<Object> get props => [id];
}
