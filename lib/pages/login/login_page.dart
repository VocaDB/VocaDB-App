import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.person), labelText: "Username"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: "Password"),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {},
                  child: Text('Sign in'),
                  textTheme: ButtonTextTheme.primary),
              RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                  textTheme: ButtonTextTheme.normal,
                  color: Colors.grey.shade600)
            ],
          )
        ],
      ),
    );
  }
}
