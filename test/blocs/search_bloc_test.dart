import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/web_service.dart';

class MockResource extends Mock implements Resource {}
class MockWebService extends Mock implements WebService {}

main() {

  final List<EntryModel> mockResults = [
    EntryModel.fromJson({ 'id': 1, 'name': 'A' }),
    EntryModel.fromJson({ 'id': 2, 'name': 'B' }),
    EntryModel.fromJson({ 'id': 3, 'name': 'C' }),
    EntryModel.fromJson({ 'id': 4, 'name': 'D' }),
  ];

  setUp(() {
    var mockResource = MockResource();
    when(MockWebService().load(mockResource)).thenAnswer((_) => Future.value(mockResults));
  }); 
  test('should emits query when update query', () async {
    final bloc = SearchBloc();

    bloc.updateQuery('abc');
    
    await expectLater(bloc.queryStream, emits('abc'));
  });

  test('should emits empty query when clear query', () async {
    final bloc = SearchBloc();

    bloc.updateQuery('abc');
    
    await expectLater(bloc.queryStream, emits('abc'));

    bloc.clearQuery();

    await expectLater(bloc.queryStream, emits(''));
  });

  test('should emits empty query when clear query', () async {
    final bloc = SearchBloc();

    bloc.updateQuery('abc');
    
    await expectLater(bloc.queryStream, emits('abc'));

    bloc.clearQuery();

    await expectLater(bloc.queryStream, emits(''));
  });
}