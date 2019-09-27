import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class RankingBloc {

  final _daily = BehaviorSubject<List<SongModel>>.seeded([]);
  final _weekly = BehaviorSubject<List<SongModel>>.seeded([]);
  final _monthly = BehaviorSubject<List<SongModel>>.seeded([]);
  final _overall = BehaviorSubject<List<SongModel>>.seeded([]);
  
  Observable get daily$ => _daily.stream;
  Observable get weekly$ => _weekly.stream;
  Observable get monthly$ => _monthly.stream;
  Observable get overall$ => _overall.stream;

  final ConfigBloc configBloc;
  final _songService = SongRestService();

  RankingBloc(this.configBloc) {
    fetch();
  }

  void fetch() {
    updateByDuration(RankDuration.DAILY).then(_daily.add);
    updateByDuration(RankDuration.WEEKLY).then(_weekly.add);
    updateByDuration(RankDuration.MONTHLY).then(_monthly.add);
    updateByDuration(RankDuration.OVERALL).then(_overall.add);
  }

  Future<List<SongModel>> updateByDuration(int durationHours) async {
    print('updateDaily...$durationHours');
    return _songService.topRated(durationHours: durationHours, lang: configBloc.contentLang);
  }

  void dispose() {
    _daily.close();
    _weekly.close();
    _monthly.close();
    _overall.close();
  }
}