import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/event_series_bloc.dart';
import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/services/release_event_series_rest_service.dart';

class MockReleaseEventSeriesService extends Mock implements ReleaseEventSeriesRestService {}

class MockConfigBloc extends Mock implements ConfigBloc {}

main() {
  
  MockConfigBloc mockConfigBloc = MockConfigBloc();


  setUp(() {
    when(mockConfigBloc.contentLang).thenReturn('Default');
  });

  test('should emits event series detail', () async {
    MockReleaseEventSeriesService mockReleaseEventSeriesService = MockReleaseEventSeriesService();

    final ReleaseEventSeriesModel mockResult = ReleaseEventSeriesModel.fromJson({'id': 1, 'name': 'A'});

    when(mockReleaseEventSeriesService.byId(any)).thenAnswer((_) => Future.value(mockResult));

    EventSeriesBloc bloc = EventSeriesBloc(1, releaseEventSeriesService: mockReleaseEventSeriesService, configBloc: mockConfigBloc);

    await expectLater(bloc.eventSeriesDetail$, emits(mockResult));

    verify(mockReleaseEventSeriesService.byId(any)).called(1);
  });
}