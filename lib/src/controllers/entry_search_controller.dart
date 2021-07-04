import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class EntrySearchController extends SearchPageController<EntryModel> {
  /// Filter parameter
  final entryType = ''.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final EntryRepository entryRepository;

  final enableInitial = false;

  final SharedPreferenceService sharedPreferenceService;

  EntrySearchController(
      {this.entryRepository, SharedPreferenceService sharedPreferenceService})
      : sharedPreferenceService =
            sharedPreferenceService ?? Get.find<SharedPreferenceService>();

  @override
  void onInit() {
    [entryType, sort, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    super.onInit();
  }

  @override
  Future<List<EntryModel>> fetchApi({int start}) => entryRepository
      .findEntries(
          query: query.string,
          entryType: entryType.string,
          lang: sharedPreferenceService.getContentLang,
          sort: sort.string,
          tagIds: tags.map((e) => e.id.toString()).toList())
      .catchError(super.onError);
}
