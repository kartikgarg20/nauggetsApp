import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/login_controller.dart';

class ForgotDialog extends StatelessWidget {
  ForgotDialog({Key? key}) : super(key: key);
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _loginController.forgetController.value,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    labelText: 'Enter the Email',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 25)),
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
                cursorColor: Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 195, 0, 0),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(child: Text('Reset Password')),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class EmailList extends StatelessWidget {
  const EmailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('george.bluth@reqres.in'),
              Text('janet.weaver@reqres.in'),
              Text('emma.wong@reqres.in'),
              Text('eve.holt@reqres.in'),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
