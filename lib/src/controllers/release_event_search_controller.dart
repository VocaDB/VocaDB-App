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

  final fromDate = Rx<DateTime>();

  final toDate = Rx<DateTime>();

  final artists = <ArtistModel>[].obs;

  final tags = <TagModel>[].obs;

  final ReleaseEventRepository releaseEventRepository;

  TextEditingController textSearchController;

  ReleaseEventSearchController({this.releaseEventRepository});

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
            lang: SharedPreferenceService.lang,
            maxResults: maxResults,
            query: query.string,
            category: category.string,
            sort: sort.string,
            artistIds: artists.toList().map((e) => e.id).join(','),
            tagIds: tags.toList().map((e) => e.id).join(','),
            beforeDate: DateTimeUtils.toUtcDateString(toDate.value),
            afterDate: DateTimeUtils.toUtcDateString(fromDate.value),
          )
          .catchError(super.onError);
}
