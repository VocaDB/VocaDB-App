import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class MockAlbumRepository extends Mock implements AlbumRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthService extends Mock implements AuthService {}

void main() {
  final MockAlbumRepository mockAlbumRepository = MockAlbumRepository();
  final MockUserRepository mockUserRepository = MockUserRepository();
  final MockAuthService mockAuthService = MockAuthService();

  test('should get album collection status success', () async {
    final AlbumCollectionStatusModel mockCollectionStatus =
        AlbumCollectionStatusModel(purchaseStatus: 'Wishlisted');

    final mockUserModel = Rx<UserModel>();
    mockUserModel(UserModel(id: 1));

    when(mockAuthService.currentUser).thenReturn(mockUserModel);

    when(mockUserRepository.getCurrentUserAlbumCollection(1))
        .thenAnswer((_) => Future.value(mockCollectionStatus));

    final AlbumDetailController controller = AlbumDetailController(
        userRepository: mockUserRepository,
        albumRepository: mockAlbumRepository,
        authService: mockAuthService);

    controller.album(AlbumModel(id: 1));

    await controller.checkAlbumCollectionStatus();

    expect(controller.collectionStatus.value.purchaseStatus, "Wishlisted");
  });
}
