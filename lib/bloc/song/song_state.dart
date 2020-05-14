import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/models/models.dart';

abstract class SongState extends Equatable {
  const SongState();

  @override
  List<Object> get props => [];
}

class SongEmpty extends SongState {}

class SongLoading extends SongState {}

class SongLoaded extends SongState {
  final List<SongModel> songs;

  const SongLoaded({@required this.songs}) : assert(songs != null);

  @override
  List<Object> get props => [songs];
}

class SongError extends SongState {}
