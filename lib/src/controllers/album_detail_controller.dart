import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class AlbumDetailController extends GetxController {
  final collectionStatus = AlbumCollectionStatusModel().obs;

  final purchaseStatus = "".obs;

  final mediaType = "".obs;

  final rating = 0.obs;

  final initialLoading = true.obs;

  final statusLoading = true.obs;

  final album = AlbumModel().obs;

  final AlbumRepository albumRepository;

  final UserRepository userRepository;

  final AuthService authService;

  AlbumDetailController(
      {this.albumRepository, this.authService, this.userRepository});

  @override
  void onInit() {
    initArgs();
    checkAlbumCollectionStatus();
    fetchApis();
    super.onInit();
  }

  initArgs() {
    AlbumDetailArgs args = Get.arguments;

    if (args.album != null) {
      album(args.album);
    } else {
      album(AlbumModel(id: args.id));
    }
  }

  fetchApis() => albumRepository
      .getById(album().id, lang: SharedPreferenceService.lang)
      .then(album)
      .then(initialLoadingDone);

  Future<void> checkAlbumCollectionStatus() {
    if (authService.currentUser == null ||
        authService.currentUser().id == null) {
      return Future.value();
    }

    return userRepository
        .getCurrentUserAlbumCollection(album().id)
        .then((AlbumCollectionStatusModel model) {
          if (model == null) {
            return AlbumCollectionStatusModel();
          }

          this.purchaseStatus(model.purchaseStatus);
          this.mediaType(model.mediaType);
          this.rating(model.rating);

          return collectionStatus(model);
        })
        .then((artist) => debounce(
            collectionStatus, (_) => updateAlbumCollection(),
            time: Duration(seconds: 1)))
        .then(statusLoadingDone);
  }

  updateAlbumCollection() {
    //TODO: Wait for API backend implementation
  }

  initialLoadingDone(_) => initialLoading(false);

  statusLoadingDone(_) => statusLoading(false);
}
