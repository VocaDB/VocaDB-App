import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class RankingController extends GetxController {
  final initialLoading = true.obs;

  /// List of top rated songs in 24 hours.
  final daily = <SongModel>[].obs;

  /// List of top rated songs in 7 days.
  final weekly = <SongModel>[].obs;

  /// List of top rated songs in 30 days.
  final monthly = <SongModel>[].obs;

  /// List of top rated songs all times.
  final overall = <SongModel>[].obs;

  /// Filter parameter.
  final filterBy = 'CreateDate'.obs;

  /// Filter parameter.
  final vocalist = 'Nothing'.obs;

  final SongRepository songRepository;

  RankingController({this.songRepository});

  @override
  void onInit() {
    fetchApi();
    ever(filterBy, (_) => fetchApi());
    ever(vocalist, (_) => fetchApi());
    super.onInit();
  }

  fetchApi() {
    String lang = SharedPreferenceService.lang;
    songRepository
        .getTopRatedDaily(
            filterBy: filterBy.string, vocalist: vocalist.string, lang: lang)
        .then(daily);
    songRepository
        .getTopRatedWeekly(
            filterBy: filterBy.string, vocalist: vocalist.string, lang: lang)
        .then(weekly);
    songRepository
        .getTopRatedMonthly(
            filterBy: filterBy.string, vocalist: vocalist.string, lang: lang)
        .then(monthly);
    songRepository
        .getTopRated(
            filterBy: filterBy.string, vocalist: vocalist.string, lang: lang)
        .then(overall);
  }
}
