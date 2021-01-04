import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class EntrySearchController extends GetxController {
  /// List of results from search
  final results = <EntryModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = true.obs;

  /// Filter parameter
  final entryType = ''.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final EntryRepository entryRepository;

  TextEditingController textSearchController;

  EntrySearchController({this.entryRepository});

  @override
  void onInit() {
    [entryType, sort, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => entryRepository
      .findEntries(
          query: query.string,
          entryType: entryType.string,
          sort: sort.string,
          tagIds: tags.toList().map((e) => e.id).join(','))
      .then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }
}
