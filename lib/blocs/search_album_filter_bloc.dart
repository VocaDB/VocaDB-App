import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/tag_model.dart';

class SearchAlbumFilterBloc {
  final _albumType = BehaviorSubject<String>();
  final _sort = BehaviorSubject<String>();
  final _artists = BehaviorSubject<Map<int, ArtistModel>>();
  final _tags = BehaviorSubject<Map<int, TagModel>>();

  Observable get albumType$ => _albumType.stream;
  Observable get sort$ => _sort.stream;
  Observable get artists$ => _artists.stream;
  Observable get tags$ => _tags.stream;

  String get albumType => _albumType.value;
  String get sort => _sort.value;
  Map<int, ArtistModel> get artists => _artists.value;
  Map<int, TagModel> get tags => _tags.value;
  List<ArtistModel> get artistList => artists?.values?.toList();
  List<TagModel> get tagList => tags?.values?.toList();

  Observable get params$ =>
      Observable.merge([albumType$, sort$, artists$, tags$]);

  void updateAlbumType(String albumType) {
    _albumType.add(albumType);
  }

  void updateSort(String sort) {
    _sort.add(sort);
  }

  Future<void> addArtist(ArtistModel artist) {
    Map<int, ArtistModel> a = artists ?? {};
    a.putIfAbsent(artist.id, () => artist);
    _artists.add(a);

    return Future.value();
  }

  void removeArtist(int id) {
    Map<int, ArtistModel> a = artists;
    a.remove(id);
    _artists.add(a);
  }

  Future<void> addTag(TagModel tag) {
    Map<int, TagModel> a = tags ?? {};
    a.putIfAbsent(tag.id, () => tag);
    _tags.add(a);

    return Future.value();
  }

  void removeTag(int id) {
    Map<int, TagModel> a = tags;
    a.remove(id);
    _tags.add(a);
  }

  Map<String, String> params() {
    Map<String, String> params = {'sort': sort ?? 'Name'};
    if (albumType != null) params['discTypes'] = albumType;
    if (tagList != null && tagList.length > 0)
      params['tagId'] = tags.keys.join(',');
    if (artistList != null && artistList.length > 0)
      params['artistId'] = artists.keys.join(',');

    return params;
  }

  void dispose() {
    _albumType.close();
    _sort.close();
    _artists.close();
    _tags.close();
  }
}
