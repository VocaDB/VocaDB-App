import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc();

  MainState get initialState => DisplayHomeTab();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is TabPressed) {
      switch (event.index) {
        case 1:
          yield DisplayRankingTab();
          break;
        default:
          yield DisplayHomeTab();
      }
    }
  }
}
