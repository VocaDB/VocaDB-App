import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class SongSearchController extends GetxController {
  /// List of results from search
  final results = <SongModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  final SongRepository songRepository;

  TextEditingController textSearchController;

  SongSearchController({this.songRepository});

  @override
  void onInit() {
    fetchApi();
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => songRepository.findSongs(query: query.string).then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }
}
