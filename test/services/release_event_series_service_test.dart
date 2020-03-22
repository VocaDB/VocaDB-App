import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/services/release_event_series_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class MockRestApi extends Mock implements RestApi {}

main() {
  final mockRestApi = MockRestApi();
  final service = ReleaseEventSeriesRestService(restApi: mockRestApi);

  test('should return releaseEvent detail', () {
    when(mockRestApi.get(any, any))
        .thenAnswer((_) => Future.value({'id': 1, 'name': 'A'}));

    expect(service.byId(1), completion(isA<ReleaseEventSeriesModel>()));
  });
}
