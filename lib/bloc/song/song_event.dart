import 'package:equatable/equatable.dart';
import 'package:vocadb/parameters/parameters.dart';

abstract class SongEvent extends Equatable {
  const SongEvent();
}

class FetchSongs extends SongEvent {
  final SongParameter songParameter;

  const FetchSongs({this.songParameter});

  @override
  List<Object> get props => [songParameter];
}

class FetchHighlighted extends SongEvent {
  final SongParameter songParameter;

  const FetchHighlighted({this.songParameter});

  @override
  List<Object> get props => [songParameter];
}

class FetchSongDetail extends SongEvent {
  final int id;
  final SongParameter songParameter;

  const FetchSongDetail(this.id, {this.songParameter});

  @override
  List<Object> get props => [id];
}
