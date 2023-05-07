import 'package:flutter/material.dart';
import 'package:signup_app/screens/home_page/widgets.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [AccountDetail(), circleWidget(), Spacer(), balanceInfo()],
      ),
    );
  }

  Widget balanceInfo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          extraTile(name: 'Incomes', amount: '332'),
          extraTile(name: 'Expense', amount: '209')
        ],
      ),
    );
  }

  Widget extraTile({required String name, required String amount}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            amount,
            style: TextStyle(fontSize: 40),
          ),
        )
      ],
    );
  }

  Widget circleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 300,
            margin: const EdgeInsets.only(top: 20),
            child: const CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 206, 206, 206),
              strokeWidth: 1,
              value: 0.8,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 250,
                width: 250,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 206, 206, 206),
                  strokeWidth: 1,
                  value: 0.7,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$333,454',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.analytics_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
