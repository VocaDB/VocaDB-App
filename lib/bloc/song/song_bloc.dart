import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/repositories/repositories.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository repository;

  SongBloc({@required this.repository}) : assert(repository != null);

  @override
  SongState get initialState => SongEmpty();

  @override
  Stream<SongState> mapEventToState(SongEvent event) async* {
    if (event is FetchSongs) {
      yield SongLoading();
      try {
        final List<SongModel> songs = await repository.findAll();
        yield SongLoaded(songs: songs);
      } catch (_) {
        yield SongError();
      }
    }
  }
}
