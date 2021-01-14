import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class SongSearchController extends SearchPageController<SongModel> {
  /// Filter parameter
  final songType = ''.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final SongRepository songRepository;

  SongSearchController({this.songRepository});

  @override
  void onInit() {
    [songType, sort, artists, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  @override
  Future<List<SongModel>> fetchApi({int start}) => songRepository
      .findSongs(
          start: (start == null) ? 0 : start,
          lang: SharedPreferenceService.lang,
          query: query.string,
          songType: songType.string,
          sort: sort.string,
          artistIds: artists.toList().map((e) => e.id).join(','),
          tagIds: tags.toList().map((e) => e.id).join(','))
      .catchError(super.onError);
}
