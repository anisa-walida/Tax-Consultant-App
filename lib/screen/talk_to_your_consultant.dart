import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/utils/get_user_gid.dart';
import 'specific_consultant.dart';


class TalkToConsultant extends StatefulWidget {
  //final String consultant_userUid;
//  TalkToConsultant({});

  @override
  State<TalkToConsultant> createState() => _TalkToConsultantState();
}

class _TalkToConsultantState extends State<TalkToConsultant> {
  Query dbRef = FirebaseDatabase.instance.ref().child('consultant');
  Query dbRef2 = FirebaseDatabase.instance.ref().child('guser');
  bool isConditionMet = false;
  String guser_userUid = UserInformation.guser_userUid;


  Widget listItem({required Map guser, required Function onTap}) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("f2ebe6"),
              hexStringToColor("C3B091"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () {
            onTap(
             // consultant['uniqueKey'],
              guser['uniqueKey_consultant'],
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/checklist.png", // Replace with the path to your image asset
                width: 40, // Adjust the width as needed
                height: 40, // Adjust the height as needed
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Tap to see your consultant details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    bool hasShownItem = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,
        title: const Text(
          "Contact Consultant",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("F5F5EF"),
              hexStringToColor("C2B280"),
              hexStringToColor("B69D74"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 240.0),
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef2,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map guser = snapshot.value as Map;
                  print("#####################################################");
                  print(guser['guser_userUid']);
                //  print(widget.consultant_userUid);

                  if (guser['guser_userUid'] ==
                      guser_userUid&& !hasShownItem) {
                    hasShownItem = true;

                    return listItem(
                        guser: guser, onTap: navigateToDetailPage);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetailPage(
      String uniqueKey_consultant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SpecificClient(
          consultant_uniqueKey: uniqueKey_consultant,
        ),
      ),
    );
  }
}