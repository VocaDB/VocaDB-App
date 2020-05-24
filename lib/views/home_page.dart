import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return Column(
              children: <Widget>[
                Image.network(state.user.imageUrl),
                Text(state.user.name),
                FlatButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                    },
                    child: Text('Log out')),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
