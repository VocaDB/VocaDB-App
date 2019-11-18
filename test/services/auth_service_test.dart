import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

// Demo login
main() async {
  var dio =  Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  
  final username = 'your_username';
  final password = 'your_password';

  await dio.post("https://vocadb.net/User/Login", data: {
      'UserName': username,
      'Password': password,
  })

  // Error
  .then((res) {
    print('Failed to login!');
    print(res);
    throw Exception('Failed to login');
  })

  // Success and status code is 302
  .catchError((err) {
    
    if(err is DioError && err.response.statusCode == 302) {
      return dio.get('https://vocadb.net/api/users/current?fields=MainPicture');
    }
    
    throw err;
  })
  
  // Get current user success
  .then((res) {
    print('current user');
    print(res);
  })
  
  // Error if cannot get current user
  .catchError((err) {
    print('current user error');
    print(err);
  });

  // Print cookies
  print(cookieJar.loadForRequest(Uri.parse("https://vocadb.net/")));

  print('done');
}