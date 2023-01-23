import 'package:vocadb_app/src/features/entries/domain/entries_list_params.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';

abstract class EntryRepository {
  Future<List<Entry>> fetchEntriesList({EntriesListParams params});
}
