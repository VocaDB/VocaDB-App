import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:vocadb/models/user_cookie.dart';
import 'package:vocadb/models/user_model.dart';
import 'package:vocadb/repositories/repositories.dart';

class UserRepository {
  final String endpoint = '/api/users';
  final VocaDBApiClient apiClient;

  UserRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<UserCookie> login({
    @required String username,
    @required String password,
  }) async {
    return await apiClient.login(username, password);
  }

  Future<UserModel> getCurrent() async {
    try {
      UserModel us = await apiClient.get('$endpoint/current',
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
