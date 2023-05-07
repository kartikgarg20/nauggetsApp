import 'package:flutter/material.dart';

import '../widgets.dart';

class Data extends StatelessWidget {
  Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AccountDetail(),
            balance(),
            middleIcons(context),
            cardDetail(
                date: "24/6",
                name: "Tommy Berns",
                number: "3344 2342 2422 2242"),
            listVewiItems()
          ],
        ),
      ),
    );
  }

  Widget balance() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: const [
          Text(
            'Balance   ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text("\$22,333",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget middleIcons(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconContainer(
              icon: const Icon(
            Icons.add,
            size: 35,
            color: Colors.blue,
          )),
          iconContainer(
              icon: const Icon(
            Icons.search,
            size: 35,
            color: Colors.blue,
          )),
          iconContainer(
              icon: const Icon(
            Icons.analytics_outlined,
            size: 35,
            color: Colors.blue,
          ))
        ],
      ),
    );
  }

  Widget iconContainer({required Icon icon}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: const Color.fromARGB(255, 255, 255, 255),
          shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }

  Widget cardDetail(
      {required String name, required String number, required String date}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: AssetImage(
                      'assets/images/card.jpg',
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            "CARD",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            number,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          const Text(
                            'Card Number',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Text(
                                'Name',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                date,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Text(
                                'Vaild',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listVewiItems() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return listCard(index);
      },
    );
  }

  List<String> myList = ["My Cards", "My Transactions", "All Cards", "Balance"];
  Widget listCard(index) {
    return Container(
      decoration: const BoxDecoration(
          //                    <-- BoxDecoration
          border: Border(bottom: BorderSide())),
      child: ListTile(
        trailing: const Icon(Icons.arrow_forward_ios),
        title: Text(
          myList[index],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
