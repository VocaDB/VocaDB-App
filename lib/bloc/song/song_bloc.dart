import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/repositories/repositories.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository songRepository;

  SongBloc({@required this.songRepository}) : assert(songRepository != null);

  @override
  SongState get initialState => SongEmpty();

  @override
  Stream<SongState> mapEventToState(SongEvent event) async* {
    if (event is FetchSongs) {
      yield SongLoading();
      try {
        final List<SongModel> songs = await songRepository.findAll();
        yield SongLoaded(songs: songs);
      } catch (_) {
        yield SongError();
      }
    }

    if (event is FetchHighlighted) {
      yield SongLoading();
      try {
        final List<SongModel> songs =
            await songRepository.highlighted();
        yield SongLoaded(songs: songs);
      } catch (_) {
        yield SongError();
      }
    }

    if (event is FetchSongDetail) {
      yield SongLoading();
      try {
        final SongModel song = await songRepository.findById(event.id);
        yield SongDetailLoaded(song: song);
      } catch (_) {
        yield SongError();
      }
    }
  }
}
