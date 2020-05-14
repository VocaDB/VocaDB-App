import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:vocadb/bloc/app/app_event.dart';
import 'package:vocadb/bloc/app/app_state.dart';
import 'package:vocadb/repositories/repositories.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final VocaDBRepository repository;

  AppBloc({@required this.repository}) : assert(repository != null);

  @override
  AppState get initialState => AppInitializeState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {}
}
