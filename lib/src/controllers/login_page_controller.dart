import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/auth_repository.dart';

class LoginPageController extends GetxController {
  final AuthRepository authRepository;

  final AuthService authService;

  final username = ''.obs;
  final password = ''.obs;

  LoginPageController({this.authRepository, this.authService});

  login() {
    print(username.string);
    print(password.string);
    authRepository
        .login(username: this.username.string, password: this.password.string)
        .then((_) => authService.getCurrent())
        .then(postLoginSuccess)
        .catchError(error);
  }

  void postLoginSuccess(user) {
    print('login success $user');
    authService.currentUser(user);
    Get.off(MainPage());
  }

  void onUsernameChanged(value) {
    print(value);
    username(value);
  }

  void onPasswordChanged(value) => password(value);

  void error(err) {
    print('Error occurs...$err');
    Get.snackbar("Error", "Failed to login");
  }
}
