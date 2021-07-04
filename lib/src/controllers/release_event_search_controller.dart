import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/utils.dart';

class ReleaseEventSearchController
    extends SearchPageController<ReleaseEventModel> {
  /// Filter parameter
  final category = ''.obs;

  final sort = 'Name'.obs;

  final fromDate = Rx<DateTime>(null);

  final toDate = Rx<DateTime>(null);

  final artists = <ArtistModel>[].obs;

  final tags = <TagModel>[].obs;

  final ReleaseEventRepository releaseEventRepository;

  TextEditingController textSearchController;

  final SharedPreferenceService sharedPreferenceService;

  ReleaseEventSearchController(
      {this.releaseEventRepository,
      SharedPreferenceService sharedPreferenceService})
      : sharedPreferenceService =
            sharedPreferenceService ?? Get.find<SharedPreferenceService>();

  @override
  void onInit() {
    [category, sort, artists, tags, fromDate, toDate]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  Future<List<ReleaseEventModel>> fetchApi({int start}) =>
      releaseEventRepository
          .findReleaseEvents(
            start: (start == null) ? 0 : start,
            lang: sharedPreferenceService.getContentLang,
            maxResults: maxResults,
            query: query.string,
            category: category.string,
            sort: sort.string,
            artistIds: artists.map((e) => e.id.toString()).toList(),
            tagIds: tags.map((e) => e.id.toString()).toList(),
            beforeDate: DateTimeUtils.toUtcDateString(toDate.value),
            afterDate: DateTimeUtils.toUtcDateString(fromDate.value),
          )
          .catchError(super.onError);
}
