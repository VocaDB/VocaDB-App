import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class ArtistSearchController extends GetxController {
  /// List of results from search
  final results = <ArtistModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final artistType = 'Nothing'.obs;

  final sort = 'Name'.obs;

  final tags = <TagModel>[].obs;

  final ArtistRepository artistRepository;

  TextEditingController textSearchController;

  ArtistSearchController({this.artistRepository});

  @override
  void onInit() {
    fetchApi();
    [artistType, sort, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => artistRepository
      .findArtists(
        query: query.string,
        artistType: artistType.string,
        sort: sort.string,
        tagIds: tags.toList().map((e) => e.id).join(','),
      )
      .then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }
}
