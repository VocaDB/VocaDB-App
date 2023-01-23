import 'package:vocadb_app/src/features/entries/data/constants/fake_entry_list.dart';
import 'package:vocadb_app/src/features/entries/data/entry_repository.dart';
import 'package:vocadb_app/src/features/entries/domain/entries_list_params.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';

class EntryFakeRepository implements EntryRepository {
  @override
  Future<List<Entry>> fetchEntriesList(
      {EntriesListParams params = const EntriesListParams()}) {
    return Future.value(kFakeEntryList);
  }
}
