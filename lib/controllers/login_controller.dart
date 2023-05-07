import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/api_service.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> forgetController = TextEditingController().obs;
  final isLoading = false.obs;
  final isValid = false.obs;

  @override
  void onInit() {
    // register();

    super.onInit();
  }

  final isLogin = false.obs;
  final isPrefs = false.obs;

  // String email = "tony@starkindustries.com";

  bool checkData() {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.value.text);
    if (emailValid && passwordController.value.text.length >= 8) {
      isLogin(true);
      return true;
    } else {
      isLogin(false);
      return false;
    }
  }

  var res;

  Future<void> register() async {
    try {
      isLoading(true);
      var data = await RemoteService.post(myMap: {
        "email": emailController.value.text,
        "password": passwordController.value.text
      }, key: "api/register");
      if (data != null) {
        res = jsonDecode(data);
      } else {}
      // var res = RepliesApi.fromJson(json.decode(data));
      if (res != null) {
        isValid(true);
      } else {
        isValid(false);
      }
      isLoading(false);
    } on Exception catch (e) {
      isLoading(false);
      debugPrint(e.toString());
      update();
    }
  }
}
