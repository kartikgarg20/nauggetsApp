import 'package:flutter/material.dart';

class AccountDetail extends StatelessWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.person,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tommy Berns',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromARGB(255, 0, 92, 168)),
              ),
              Row(
                children: const [
                  Text(
                    'Los Anglaes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  Icon(Icons.location_on)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
