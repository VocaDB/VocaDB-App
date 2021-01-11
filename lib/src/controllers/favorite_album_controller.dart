import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteAlbumController extends GetxController {
  /// List of results from search
  final results = <AlbumUserModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final purchaseStatuses = ''.obs;

  /// Filter parameter
  final discType = 'Nothing'.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  final UserRepository userRepository;

  final AuthService authService;

  TextEditingController textSearchController;

  FavoriteAlbumController({this.userRepository, this.authService});

  @override
  void onInit() {
    if (authService.currentUser().id == null) {
      print('Error user not login yet.');
    }
    fetchApi();
    [purchaseStatuses, discType, sort, tags, artists]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => userRepository
      .getAlbums(authService.currentUser().id,
          discType: discType.string,
          purchaseStatuses: purchaseStatuses.string,
          sort: sort.string,
          lang: SharedPreferenceService.lang,
          artistIds: artists.toList().map((e) => e.id).join(','),
          tagIds: tags.toList().map((e) => e.id).join(','))
      .then(results);

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  @override
  void onClose() {
    textSearchController.dispose();
    super.onClose();
  }
}
