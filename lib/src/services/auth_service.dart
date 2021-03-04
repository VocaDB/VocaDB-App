import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/utils.dart';

class AuthService extends GetxService {
  final HttpService httpService;

  final AppDirectory appDirectory;

  final currentUser = UserModel().obs;

  AuthService({this.httpService, this.appDirectory})
      : assert(httpService != null),
        assert(appDirectory != null);

  Future<UserCookie> login({
    String username,
    String password,
  }) async {
    return await httpService.login(username, password);
  }

  Future<AuthService> checkCurrentUser() async {
    print('check current user');
    this.getCurrent().then(currentUser).catchError(print);
    return this;
  }

  Future<UserModel> getCurrent() async {
    Map<String, String> data = {'fields': 'MainPicture'};
    try {
      UserModel us = await httpService
          .get('/api/users/current', data)
          .then((item) => UserModel.fromJson(item));
      print('current user : $us');
      return us;
    } catch (e) {
      if (e is DioError && e.response.statusCode == 404) {
        print('current user not found');
        return null;
      }

      print('Unknown error from get current user $e');

      throw e;
    }
  }

  Future<void> logout() async {
    appDirectory.clearCookies();
    currentUser(new UserModel());
  }
}
