import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class AlbumDetailController extends GetxController {
  final album = AlbumModel().obs;

  final AlbumRepository albumRepository;

  AlbumDetailController({this.albumRepository});

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

  fetchApis() => albumRepository.getById(album().id).then(album);
}
