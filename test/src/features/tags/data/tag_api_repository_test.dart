import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/tags/data/tag_api_repository.dart';
import 'package:vocadb_app/src/features/tags/data/tag_repository.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';

import '../../../mocks.dart';

void main() {
  group('tagApiRepository', () {
    late TagRepository tagRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      tagRepository = TagApiRepository(client: client);
    });

    test('fetchTagID', () async {
      when(() => client.get('/api/tags/1',
              params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value({'id': 1, 'name': 'Miku'}));

      final result = await tagRepository.fetchTagID(1);

      verify(() =>
          client.get('/api/tags/1', params: any(named: 'params', that: isMap)));

      expect(result, Tag(id: 1, name: 'Miku'));
    });
  });
}
