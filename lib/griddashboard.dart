import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tax_consultant/screen/consultant_list_user.dart';
import 'package:tax_consultant/screen/tax_rules.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/screen/talk_to_your_consultant.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GridDashboard extends StatelessWidget {
  GridDashboard({super.key});

  Item item1 = new Item(
    title: "Consultant List",
    img: "assets/images/customer.png",
  );
  Item item2 = new Item(
    title: "Tax Laws",
    img: "assets/images/court.png",
  );
  Item item3 = new Item(
    title: "Online \nPayment",
    img: "assets/images/wallet.png",
  );
  Item item4 = new Item(
    title: "Contact with \n Consultant",
    img: "assets/images/chat.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Item> MyList = [item1, item2, item3, item4];
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: MyList.map((data) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexStringToColor("C3B091"),
                    hexStringToColor("483C32"),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Colors.brown[100],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            onTap: () async {
              if (data == item1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultantList()));
              } else if (data == item2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TaxRules()));
              } else if (data == item3) {
                launchBkashApp(context);
              } else if (data == item4) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TalkToConsultant()));
              } else {
                print('Tapped item: ${data.title}');
              }//TalkToConsultant
            },
          );
        }).toList(),
      ),
    );
  }

  void launchBkashApp(BuildContext context) async {
    const url = "https://www.bkash.com/en/app";

    // Replace with your actual Bkash URL

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        await launch("https://play.google.com/store/apps/details?id=com.bKash.customerapp");
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching Bkash app: $e');
      // Handle the error as needed
    }
  }
}

class Item {
  String title;
  String img;
  Item({this.title = '', this.img = '',});
}