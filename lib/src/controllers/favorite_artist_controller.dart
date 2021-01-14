import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteArtistController
    extends SearchPageController<FollowedArtistModel> {
  /// Filter parameter
  final artistType = ''.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final UserRepository userRepository;

  final AuthService authService;

  FavoriteArtistController({this.userRepository, this.authService});

  @override
  void onInit() {
    if (authService.currentUser().id == null) {
      print('Error user not login yet.');
    }
    [artistType, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  Future<List<FollowedArtistModel>> fetchApi({int start}) => userRepository
      .getFollowedArtists(authService.currentUser().id,
          query: query.string,
          start: (start == null) ? 0 : start,
          maxResults: maxResults,
          lang: SharedPreferenceService.lang,
          artistType: artistType.string,
          tagIds: tags.toList().map((e) => e.id).join(','))
      .catchError(super.onError);
}
