import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:signup_app/controllers/signup_controller.dart';
import 'package:signup_app/screens/home_page/home_page.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({Key? key}) : super(key: key);
  final SignUpCOntroller _signController = Get.put(SignUpCOntroller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _signController.emailController.value,
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
                _signController.checkData();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _signController.passwordController.value,
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
                _signController.checkData();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              onTap: () async {
                if (_signController.isLogin.isTrue) {
                  await _signController.register();
                  if (_signController.isValid.isTrue) {
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
                    color: _signController.isLogin.isTrue
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 112, 112, 112),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: _signController.isLoading.isTrue
                        ? CircularProgressIndicator()
                        : Text('SignUp')),
              ),
            ),
          )
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
