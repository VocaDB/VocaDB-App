import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/src/widgets/space_divider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 32.0),
      child: Column(
        children: [
          Text('Demo Login'),
          SpaceDivider.medium(),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Username'),
          ),
          SpaceDivider.medium(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
          ),
          SpaceDivider.medium(),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
                onPressed: () => Get.to(MainPage()), child: Text('Log in')),
          )
        ],
      ),
    ));
  }
}
