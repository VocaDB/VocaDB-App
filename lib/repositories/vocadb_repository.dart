import 'package:meta/meta.dart';
import 'package:vocadb/repositories/repositories.dart';

import 'vocadb_api_client.dart';

class VocaDBRepository {
  final VocaDBApiClient apiClient;
  final SongRepository songRepository;
  final UserRepository userRepository;

  VocaDBRepository({@required this.apiClient})
      : songRepository = SongRepository(apiClient: apiClient),
        userRepository = UserRepository(apiClient: apiClient);
}
