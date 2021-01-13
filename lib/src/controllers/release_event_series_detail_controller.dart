import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class ReleaseEventSeriesDetailController extends AppPageController {
  final eventSeries = ReleaseEventSeriesModel().obs;

  final songs = <SongModel>[].obs;

  final albums = <AlbumModel>[].obs;

  final ReleaseEventSeriesRepository eventSeriesRepository;

  ReleaseEventSeriesDetailController({this.eventSeriesRepository});

  @override
  void onInit() {
    initArgs();
    fetchApis();
    super.onInit();
  }

  initArgs() {
    ReleaseEventSeriesDetailArgs args = Get.arguments;

    if (args.eventSeries != null) {
      eventSeries(args.eventSeries);
    } else {
      eventSeries(ReleaseEventSeriesModel(id: args.id));
    }
  }

  fetchApis() {
    String lang = SharedPreferenceService.lang;
    eventSeriesRepository
        .getById(eventSeries().id, lang: lang)
        .then(eventSeries)
        .then(super.initialLoadingDone)
        .catchError(super.onError);
  }
}
