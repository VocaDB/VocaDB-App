import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class TagSearchController extends GetxController {
  /// List of results from search
  final results = <TagModel>[].obs;

  /// Query input string
  final query = ''.obs;

  final category = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  final TagRepository tagRepository;

  TextEditingController textSearchController;

  TagSearchController({this.tagRepository});

  @override
  void onInit() {
    initArgs();
    fetchApi();
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  initArgs() {
    final TagSearchArgs args = Get.arguments;
    category(args.category);
    print(args);
  }

  fetchApi() => tagRepository
      .findTags(query: query.string, categoryName: category.string)
      .then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }
}
