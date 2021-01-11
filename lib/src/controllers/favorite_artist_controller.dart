import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteArtistController extends GetxController {
  /// List of results from search
  final results = <FollowedArtistModel>[].obs;

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
    fetchApi();
    [artistType, tags].forEach((element) => ever(element, (_) => fetchApi()));
    super.onInit();
  }

  fetchApi() => userRepository
      .getFollowedArtists(authService.currentUser().id,
          artistType: artistType.string,
          tagIds: tags.toList().map((e) => e.id).join(','))
      .then(results);
}
