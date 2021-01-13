import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class AlbumDetailController extends GetxController {
  final collected = false.obs;

  final initialLoading = true.obs;

  final album = AlbumModel().obs;

  final AlbumRepository albumRepository;

  final AuthService authService;

  AlbumDetailController({this.albumRepository, this.authService});

  @override
  void onInit() {
    initArgs();
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

  checkAlbumCollectionStatus() {
    int userId = authService.currentUser().id;

    if (userId == null) {
      return;
    }
    //TODO: Wait for API backend implementation
  }

  updateAlbumCollection() {
    //TODO: Wait for API backend implementation
  }

  initialLoadingDone(_) => initialLoading(false);
}
