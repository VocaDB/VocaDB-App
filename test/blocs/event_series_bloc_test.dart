import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/event_series_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class MockReleaseEventService extends Mock implements ReleaseEventRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  
  MockConfigBloc mockConfigBloc = MockConfigBloc();


  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits list of events', () async {
    MockReleaseEventService mockReleaseEventService = MockReleaseEventService();

    final List<ReleaseEventModel> mockResults = [
      ReleaseEventModel.fromJson({'id': 1, 'name': 'A'}),
      ReleaseEventModel.fromJson({'id': 2, 'name': 'B'}),
    ];

    when(mockReleaseEventService.bySeriesId(any)).thenAnswer((_) => Future.value(mockResults));

    EventSeriesBloc bloc = EventSeriesBloc(1, releaseEventService: mockReleaseEventService, configBloc: mockConfigBloc);

    await expectLater(bloc.events$, emits(mockResults));

    verify(mockReleaseEventService.bySeriesId(any)).called(1);
  });
}