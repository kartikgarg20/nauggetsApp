import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page/home_page.dart';
import 'login_page/login.dart';
import 'login_page/signup.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    getPrefs();
    _controller = TabController(vsync: this, length: 2);
  }

  void getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? my1 = prefs.getBool('userExist');
    if (my1 == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 0, 84, 153),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RichText(
                text: const TextSpan(
                    text: 'Welcome',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: ', To Accounts App',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: Color.fromARGB(255, 0, 135, 246)),
                  controller: _controller,
                  tabs: const [
                    Tab(icon: Text('Login')),
                    Tab(icon: Text('SignUp')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  LoginWidget(),
                  SignUpWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
