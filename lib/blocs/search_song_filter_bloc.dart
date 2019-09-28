import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/tag_model.dart';

class SearchSongFilterBloc {
  final _songType = BehaviorSubject<String>.seeded(null);
  final _sort = BehaviorSubject<String>.seeded('Name');
  final _artists = BehaviorSubject<Map<int, ArtistModel>>.seeded({});
  final _tags = BehaviorSubject<Map<int, TagModel>>.seeded({});

  Observable get songType$ => _songType.stream;
  Observable get sort$ => _sort.stream;
  Observable get artists$ => _artists.stream;
  Observable get tags$ => _tags.stream;

  String get songType => _songType.value;
  String get sort => _sort.value;
  Map<int, ArtistModel> get artists => _artists.value;
  Map<int, TagModel> get tags => _tags.value;

  Observable get params$ =>
      Observable.concat([songType$, sort$, artists$, tags$]);

  void updateSongType(String songType) {
    _songType.add(songType);
  }

  void updateSort(String sort) {
    _sort.add(sort);
  }

  void addArtist(ArtistModel artist) {
    Map<int, ArtistModel> a = artists;
    a.putIfAbsent(artist.id, () => artist);
    _artists.add(a);
  }

  void removeArtist(int id) {
    Map<int, ArtistModel> a = artists;
    a.remove(id);
    _artists.add(a);
  }

  void addTag(TagModel tag) {
    Map<int, TagModel> a = tags;
    a.putIfAbsent(tag.id, () => tag);
    _tags.add(a);
  }

  void removeTag(int id) {
    Map<int, TagModel> a = tags;
    a.remove(id);
    _tags.add(a);
  }

  Map<String, String> params() {
    Map<String, String> params = {};
    if (songType != null) params['songTypes'] = songType;
    if (sort != null) params['sort'] = sort;

    return params;
  }

  void dispose() {
    _songType.close();
    _sort.close();
    _artists.close();
    _tags.close();
  }
}
