import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_app/screens/home_page/home_page.dart';
import 'package:signup_app/screens/login_page/widgets.dart';

import '../../controllers/login_controller.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _loginController.emailController.value,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Enter the Email',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 25)),
              style: TextStyle(color: Colors.white, fontSize: 25),
              cursorColor: Colors.white,
              onChanged: (Value) {
                _loginController.checkData();
              },
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                    'Correct emails are mentions in file only thoes email will work on register and login as mentioned in assigment  use eve.holt@reqres.in'),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _loginController.passwordController.value,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Enter the Password',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 25)),
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 25),
              cursorColor: Colors.white,
              onChanged: (Value) {
                _loginController.checkData();
              },
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Password should be 8 letters or more '),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              onTap: () async {
                if (_loginController.isLogin.isTrue) {
                  await _loginController.register();
                  if (_loginController.isValid.isTrue) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    alertMessage("Enter Correct Email");
                  }
                } else {
                  alertMessage("Enter Correct Detail");
                }
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: _loginController.isLogin.isTrue
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 112, 112, 112),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: _loginController.isLoading.isTrue
                        ? CircularProgressIndicator()
                        : Text('Login')),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return EmailList();
                    });
              },
              child: const Text(
                "Email List For the Register and Login ",
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ForgotDialog();
                  });
            },
            child: Text(
              "Forgot Your Password ? ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () async {
              _loginController.isPrefs.value = !_loginController.isPrefs.value;
              if (_loginController.isPrefs.isTrue) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('userExist', true);

                alertMessage('SHared prefs are ON ');
              } else {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                alertMessage('SHared prefs are OFF');
              }
            },
            child: Text(
              "Tap to On Shared Prefs ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }

  void alertMessage(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
