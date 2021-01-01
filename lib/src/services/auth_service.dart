import 'package:dio/dio.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';

class AuthService {
  final HttpService httpService;

  UserModel currentUser;

  AuthService({this.httpService});

  Future<UserCookie> login({
    String username,
    String password,
  }) async {
    return await httpService.login(username, password);
  }

  Future<void> checkCurrenUser() async {
    print('check current user');
    this.getCurrent().then(updateCurrentUser).catchError(print);
  }

  void updateCurrentUser(UserModel user) => currentUser = user;

  Future<UserModel> getCurrent() async {
    try {
      UserModel us = await httpService.get('/api/users/current',
          {'fields': 'MainPicture'}).then((item) => UserModel.fromJson(item));

      return us;
    } catch (e) {
      if (e is DioError && e.response.statusCode == 404) {
        print('current user not found');
        return null;
      }

      throw e;
    }
  }
}
