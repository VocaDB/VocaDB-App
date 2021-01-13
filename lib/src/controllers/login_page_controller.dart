import 'package:get/get.dart';
import 'package:vocadb_app/loggers.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/auth_repository.dart';

class LoginPageController extends GetxController {
  final processing = false.obs;

  final message = ''.obs;

  final AuthRepository authRepository;

  final AuthService authService;

  final username = ''.obs;
  final password = ''.obs;

  LoginPageController({this.authRepository, this.authService});

  login() {
    processing(true);
    authRepository
        .login(username: this.username.string, password: this.password.string)
        .then((_) => authService.getCurrent())
        .then(postLoginSuccess)
        .catchError(error);
  }

  void postLoginSuccess(user) {
    processing(false);
    print('login success $user');
    authService.currentUser(user);
    Get.find<AnalyticLog>().logLogin();
    Get.off(MainPage());
  }

  void onUsernameChanged(value) {
    print(value);
    username(value);
  }

  void onPasswordChanged(value) => password(value);

  void error(err) {
    processing(false);
    print('Error occurs...$err');
    message('invalidUsernameOrPassword');
  }
}
