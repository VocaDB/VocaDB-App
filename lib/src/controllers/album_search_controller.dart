import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class AlbumSearchController extends GetxController {
  /// List of results from search
  final results = <AlbumModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final discType = 'Nothing'.obs;

  final sort = 'Name'.obs;

  final artists = <ArtistModel>[].obs;

  final tags = <TagModel>[].obs;

  final AlbumRepository albumRepository;

  TextEditingController textSearchController;

  AlbumSearchController({this.albumRepository});

  @override
  void onInit() {
    fetchApi();
    [discType, sort, artists, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => albumRepository
      .findAlbums(
        query: query.string,
        discType: discType.string,
        sort: sort.string,
        artistIds: artists.toList().map((e) => e.id).join(','),
        tagIds: tags.toList().map((e) => e.id).join(','),
      )
      .then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }
}
