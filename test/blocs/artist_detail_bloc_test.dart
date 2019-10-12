import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/artist_detail_bloc.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/artist_rest_service.dart';

class MockArtistService extends Mock implements ArtistRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  
  MockConfigBloc mockConfigBloc = MockConfigBloc();

  final ArtistModel mockSingleResult = ArtistModel.fromJson({'id': 1, 'name': 'A'});

  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits result', () async {
    MockArtistService mockArtistService = MockArtistService();

    when(mockArtistService.byId(any)).thenAnswer((_) => Future.value(mockSingleResult));

    ArtistDetailBloc bloc = ArtistDetailBloc(1, artistService: mockArtistService, configBloc: mockConfigBloc);

    await expectLater(bloc.artist$, emits(mockSingleResult));

    verify(mockArtistService.byId(any)).called(1);
  });
}