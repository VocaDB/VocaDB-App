import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/repositories/repositories.dart';
import 'package:vocadb/utils/app_directory.dart';
import 'package:vocadb/views/views.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  AppDirectory appDirectory = AppDirectory(
      applicationDocument: await getApplicationDocumentsDirectory());

  Dio dio = Dio();
  dio.interceptors
      .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  dio.interceptors.add(
      CookieManager(PersistCookieJar(dir: appDirectory.cookiesDirectory.path)));

  final VocaDBRepository repository = VocaDBRepository(
    apiClient: VocaDBApiClient(dio: dio),
  );

  runApp(App(
    repository: repository,
    appDirectory: appDirectory,
  ));
}

class App extends StatelessWidget {
  final VocaDBRepository repository;
  final AppDirectory appDirectory;

  App({Key key, @required this.repository, @required this.appDirectory})
      : assert(repository != null),
        assert(appDirectory != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
              create: (context) => AppBloc(repository: repository)),
          BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(
                    userRepository: repository.userRepository,
                    appDirectory: appDirectory,
                  )..add(AuthInit())),
        ],
        child: RepositoryProvider(
            create: (context) => repository,
            child: MaterialApp(
              title: 'VocaDB App',
              theme: ThemeData(brightness: Brightness.dark),
              initialRoute: '/',
              localizationsDelegates: [
                FlutterI18nDelegate(
                    useCountryCode: false,
                    fallbackFile: 'assets/i18n/en',
                    path: 'assets/i18n',
                    forcedLocale: Locale.fromSubtags(languageCode: 'en')),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              routes: {
                // Main page
                '/': (context) => BlocProvider<MainBloc>(
                      create: (context) => MainBloc(),
                      child: MainPage(),
                    ),

                // Login page
                LoginPage.routeName: (context) =>
                    LoginPage(userRepository: repository.userRepository),

                // Song detail page
                SongPage.routeName: (context) => SongPage(
                      songBloc:
                          SongBloc(songRepository: repository.songRepository),
                    ),

                // Song detail page
                SongDetailPage.routeName: (context) => SongDetailPage(
                      songBloc:
                          SongBloc(songRepository: repository.songRepository),
                    ),
              },
            )));
  }
}
