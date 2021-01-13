import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/pages.dart';
import 'package:vocadb_app/src/controllers/login_page_controller.dart';
import 'package:vocadb_app/src/widgets/space_divider.dart';

class LoginPage extends GetView<LoginPageController> {
  void _onTapRegister() => launch("$baseUrl/User/Create");

  void _onTapLogin() => controller.login();

  void _onTapSkip() => Get.off(MainPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 32.0),
      child: Obx(
        () => ListView(
          children: [
            Visibility(
              visible: controller.message.string.isNotEmpty,
              child: Column(
                children: [
                  Text(
                    controller.message.string.tr,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SpaceDivider.medium(),
            TextField(
              enabled: controller.processing.value == false,
              onChanged: controller.username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'username'.tr),
            ),
            SpaceDivider.medium(),
            TextField(
              enabled: controller.processing.value == false,
              onChanged: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'password'.tr),
            ),
            SpaceDivider.medium(),
            Visibility(
                visible: controller.processing.value,
                child: Center(
                  child: CircularProgressIndicator(),
                )),
            Visibility(
                visible: controller.processing.value == false,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          onPressed: this._onTapLogin, child: Text('login'.tr)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          onPressed: this._onTapRegister,
                          child: Text('register'.tr)),
                    ),
                    SpaceDivider.small(),
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          onPressed: this._onTapSkip, child: Text('skip'.tr)),
                    )
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
