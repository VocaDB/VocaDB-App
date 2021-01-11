import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class ReleaseEventDetailController extends GetxController {
  final event = ReleaseEventModel().obs;

  final songs = <SongModel>[].obs;

  final albums = <AlbumModel>[].obs;

  final ReleaseEventRepository eventRepository;

  ReleaseEventDetailController({this.eventRepository});

  @override
  void onInit() {
    initArgs();
    fetchApis();
    super.onInit();
  }

  initArgs() {
    ReleaseEventDetailArgs args = Get.arguments;

    if (args.event != null) {
      event(args.event);
    } else {
      event(ReleaseEventModel(id: args.id));
    }
  }

  fetchApis() {
    String lang = SharedPreferenceService.lang;
    eventRepository.getById(event().id, lang: lang).then(event);
    eventRepository.getAlbums(event().id, lang: lang).then(albums);
    eventRepository.getPublishedSongs(event().id, lang: lang).then(songs);
  }
}
