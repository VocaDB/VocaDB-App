import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/repositories/repositories.dart';
import 'package:vocadb/views/views.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  final UserRepository userRepository;

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.routeName, (Route<dynamic> route) => false);
        }
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: widget.userRepository,
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
