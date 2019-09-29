import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/blocs/search_entry_filter_bloc.dart';
import 'package:vocadb/models/tag_model.dart';

main() {
  SearchEntryFilterBloc bloc;

  setUp(() {
    bloc = SearchEntryFilterBloc();
  });

  test('should update sort', () async {
    bloc.updateSort('CreateDate');

    await expectLater(bloc.sort$, emits('CreateDate'));

    expect(bloc.sort, equals('CreateDate'));
  });

  test('should add and remove tag correctly', () {
    final tag1 = TagModel.fromJson({'id': 1, 'name': 'Tag_1'});
    final tag2 = TagModel.fromJson({'id': 2, 'name': 'Tag_2'});
    final tag3 = TagModel.fromJson({'id': 3, 'name': 'Tag_3'});

    bloc.addTag(tag1);

    expect(bloc.tags.containsKey(tag1.id), isTrue);

    bloc.addTag(tag1);
    bloc.addTag(tag2);
    bloc.addTag(tag3);

    expect(bloc.tags.containsKey(tag1.id), isTrue);
    expect(bloc.tags.containsKey(tag2.id), isTrue);
    expect(bloc.tags.containsKey(tag3.id), isTrue);

    bloc.removeTag(tag1.id);

    expect(bloc.tags.containsKey(tag1.id), isFalse);
    expect(bloc.tags.containsKey(tag2.id), isTrue);
    expect(bloc.tags.containsKey(tag3.id), isTrue);

    Map<String, String> params = bloc.params();
    expect(params.containsKey('tagId'), isTrue);
    expect(params['tagId'], equals('2,3'));
  });

  test('should return params correctly', () {
    Map<String, String> params = bloc.params();

    bloc.updateSort('CreateDate');

    params = bloc.params();

    expect(params.containsKey('sort'), isTrue);
    expect(params['sort'], equals('CreateDate'));
  });
}
