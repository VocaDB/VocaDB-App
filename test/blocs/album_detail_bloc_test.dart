import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/album_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';

class MockAlbumService extends Mock implements AlbumRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  
  MockConfigBloc mockConfigBloc = MockConfigBloc();

  final AlbumModel mockSingleResult = AlbumModel.fromJson({'id': 1, 'name': 'A'});

  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits result', () async {
    MockAlbumService mockAlbumService = MockAlbumService();

    when(mockAlbumService.byId(any)).thenAnswer((_) => Future.value(mockSingleResult));

    AlbumDetailBloc bloc = AlbumDetailBloc(1, albumService: mockAlbumService, configBloc: mockConfigBloc);

    await expectLater(bloc.album$, emits(mockSingleResult));

    verify(mockAlbumService.byId(any)).called(1);
  });
}