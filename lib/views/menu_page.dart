import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/views/views.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => ListView(
          children: <Widget>[
            state is AuthAuthenticated
                ? ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(state.user.mainPicture.urlThumb),
                    ),
                    title: Text(state.user.name),
                  )
                : ListTile(
                    onTap: () {
                      LoginPage.navigate(context);
                    },
                    leading: Icon(Icons.person),
                    title: Text('Log in'),
                  ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            state is AuthAuthenticated
                ? ListTile(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                      LoginPage.navigate(context);
                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Log out'),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
