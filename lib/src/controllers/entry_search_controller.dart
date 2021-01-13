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

  EntrySearchController({this.entryRepository});

  @override
  void onInit() {
    [entryType, sort, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    super.onInit();
  }

  @override
  Future<List<EntryModel>> fetchApi({int start}) => entryRepository.findEntries(
      query: query.string,
      entryType: entryType.string,
      lang: SharedPreferenceService.lang,
      sort: sort.string,
      tagIds: tags.toList().map((e) => e.id).join(','));
}
