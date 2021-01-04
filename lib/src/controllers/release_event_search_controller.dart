import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/utils.dart';

class ReleaseEventSearchController extends GetxController {
  /// List of results from search
  final results = <ReleaseEventModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final category = 'Nothing'.obs;

  final sort = 'Name'.obs;

  final fromDate = Rx<DateTime>();

  final toDate = Rx<DateTime>();

  final artists = <ArtistModel>[].obs;

  final tags = <TagModel>[].obs;

  final ReleaseEventRepository releaseEventRepository;

  TextEditingController textSearchController;

  ReleaseEventSearchController({this.releaseEventRepository});

  @override
  void onInit() {
    fetchApi();
    [category, sort, artists, tags, fromDate, toDate]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => releaseEventRepository
      .findReleaseEvents(
        query: query.string,
        category: category.string,
        sort: sort.string,
        artistIds: artists.toList().map((e) => e.id).join(','),
        tagIds: tags.toList().map((e) => e.id).join(','),
        beforeDate: DateTimeUtils.toUtcDateString(toDate.value),
        afterDate: DateTimeUtils.toUtcDateString(fromDate.value),
      )
      .then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }
}
