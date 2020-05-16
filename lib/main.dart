import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/repositories/repositories.dart';
import 'package:vocadb/views/loading_indicator.dart';
import 'package:vocadb/views/views.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final VocaDBRepository repository = VocaDBRepository(
    apiClient: VocaDBApiClient(dio: Dio()),
  );

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final VocaDBRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
              create: (context) => AppBloc(repository: repository)),
          BlocProvider<AuthBloc>(
              create: (context) =>
                  AuthBloc(userRepository: repository.userRepository)
                    ..add(AuthInit())),
        ],
        child: MaterialApp(
            title: 'VocaDB App',
            theme: ThemeData(brightness: Brightness.dark),
            home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is AuthUninitialized) {
                return SplashPage();
              }
              if (state is AuthAuthenticated) {
                return BlocProvider<SongBloc>(
                  create: (context) =>
                      SongBloc(repository: repository.songRepository),
                  child: HomePage(),
                );
              }
              if (state is AuthUnauthenticated) {
                return LoginPage(userRepository: repository.userRepository);
              }
              if (state is AuthLoading) {
                return LoadingIndicator();
              }
              return Container();
            })));

    return BlocProvider(
      create: (context) => AppBloc(repository: repository),
      child: MaterialApp(
        title: 'VocaDB App',
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            title: Text('VocaDB'),
          ),
          body: BlocProvider(create: (context) => SongBloc()),
        ),
      ),
    );
  }
}
