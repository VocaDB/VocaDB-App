import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/src/controllers/login_page_controller.dart';
import 'package:vocadb_app/src/widgets/space_divider.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 32.0),
      child: Column(
        children: [
          Text('VocaDB 3.1 Demo'),
          SpaceDivider.medium(),
          TextField(
            onChanged: controller.username,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'username'.tr),
          ),
          SpaceDivider.medium(),
          TextField(
            onChanged: controller.password,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'password'.tr),
          ),
          SpaceDivider.medium(),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text('login'.tr)),
          ),
          SpaceDivider.small(),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
                onPressed: () => Get.off(MainPage()), child: Text('skip'.tr)),
          )
        ],
      ),
    ));
  }
}
