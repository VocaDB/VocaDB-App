import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/tag_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class MockTagService extends Mock implements TagRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  
  MockConfigBloc mockConfigBloc = MockConfigBloc();

  final TagModel mockSingleResult = TagModel.fromJson({'id': 1, 'name': 'A'});

  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits result', () async {
    MockTagService mockTagService = MockTagService();

    when(mockTagService.byId(any)).thenAnswer((_) => Future.value(mockSingleResult));

    TagDetailBloc bloc = TagDetailBloc(1, tagService: mockTagService, configBloc: mockConfigBloc);

    await expectLater(bloc.tag$, emits(mockSingleResult));

    verify(mockTagService.byId(any)).called(1);
  });
}