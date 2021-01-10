import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteSongController extends GetxController {
  final initialLoading = true.obs;

  /// List of results from search
  final results = <RatedSongModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final sort = 'RatingDate'.obs;

  /// Filter parameter
  final rating = ''.obs;

  /// Filter parameter
  final groupByRating = false.obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final UserRepository userRepository;

  final AuthService authService;

  TextEditingController textSearchController;

  FavoriteSongController({this.userRepository, this.authService});

  @override
  void onInit() {
    if (authService.currentUser().id == null) {
      print('Error user not login yet.');
    }

    fetchApi();
    [rating, groupByRating, sort, artists, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => userRepository
      .getRatedSongs(authService.currentUser().id,
          query: query.string,
          rating: rating.string,
          groupByRating: groupByRating.value,
          sort: sort.string,
          artistIds: artists.toList().map((e) => e.id).join(','),
          tagIds: tags.toList().map((e) => e.id).join(','))
      .then(results)
      .then(initialLoadingDone);

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  initialLoadingDone(_) => initialLoading(false);
}
