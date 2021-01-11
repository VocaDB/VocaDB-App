import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class ArtistDetailController extends GetxController {
  final artist = ArtistModel().obs;

  final ArtistRepository artistRepository;

  ArtistDetailController({this.artistRepository});

  @override
  void onInit() {
    initArgs();
    fetchApis();
    super.onInit();
  }

  initArgs() {
    ArtistDetailArgs args = Get.arguments;

    if (args.artist != null) {
      artist(args.artist);
    } else {
      artist(ArtistModel(id: args.id));
    }
  }

  fetchApis() => artistRepository
      .getById(artist().id, lang: SharedPreferenceService.lang)
      .then(artist);
}
