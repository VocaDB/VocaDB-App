import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class RankingBloc {
  final _daily = BehaviorSubject<List<SongModel>>();
  final _weekly = BehaviorSubject<List<SongModel>>();
  final _monthly = BehaviorSubject<List<SongModel>>();
  final _overall = BehaviorSubject<List<SongModel>>();
  final _currentIndex = BehaviorSubject<int>.seeded(1);

  Observable get daily$ => _daily.stream;
  Observable get weekly$ => _weekly.stream;
  Observable get monthly$ => _monthly.stream;
  Observable get overall$ => _overall.stream;

  Observable get currentIndex => _currentIndex.stream;

  List<SongModel> get currentSongs {
    String rank = constRankings[_currentIndex.value];
    switch (rank) {
      case 'daily':
        return _daily.value;
      case 'weekly':
        return _weekly.value;
      case 'monthly':
        return _monthly.value;
      case 'overall':
        return _overall.value;
      default:
        return [];
    }
  }

  final ConfigBloc configBloc;
  final _songService = SongRestService();

  RankingBloc(this.configBloc) {
    fetch();

    Observable.merge([
      configBloc.rankingVocalist$,
      configBloc.rankingFilterBy$,
    ]).distinct().listen((event) {
      fetch();
    });
  }

  void fetch() {
    if (constRankings.contains('daily')) {
      updateByDuration(RankDuration.DAILY).then(_daily.add);
    }

    if (constRankings.contains('weekly')) {
      updateByDuration(RankDuration.WEEKLY).then(_weekly.add);
    }

    if (constRankings.contains('monthly')) {
      updateByDuration(RankDuration.MONTHLY).then(_monthly.add);
    }

    if (constRankings.contains('overall')) {
      updateByDuration(RankDuration.OVERALL).then(_overall.add);
    }
  }

  Future<List<SongModel>> updateByDuration(int durationHours) async {
    return _songService.topRated(
        durationHours: durationHours,
        filterBy: configBloc.rankingFilterBy,
        vocalist: configBloc.rankingVocalist,
        lang: configBloc.contentLang);
  }

  void updateIndex(int index) {
    _currentIndex.add(index);
  }

  void dispose() {
    _daily?.close();
    _weekly?.close();
    _monthly?.close();
    _overall?.close();
    _currentIndex?.close();
  }
}
