import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'confirm_client.dart';

class PreConfirmClient extends StatefulWidget {
  final String consultant_userUid;
  PreConfirmClient({required this.consultant_userUid});

  @override
  State<PreConfirmClient> createState() => _PreConfirmClientState();
}

class _PreConfirmClientState extends State<PreConfirmClient> {
  Query dbRef = FirebaseDatabase.instance.ref().child('consultant');
  Query dbRef2 = FirebaseDatabase.instance.ref().child('guser');
  bool isConditionMet = false;


  Widget listItem({required Map consultant, required Function onTap}) {
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
              consultant['uniqueKey'],
              consultant['count_client'],
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
                "Tap to see client request",
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,
        title: const Text(
          "Consultant Request",
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
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map consultant = snapshot.value as Map;
                  print(consultant['consultant_userUid']);
                  print(widget.consultant_userUid);

                  if (consultant['consultant_userUid'] ==
                      widget.consultant_userUid) {
                    return listItem(
                        consultant: consultant, onTap: navigateToDetailPage);
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
      String uniqueKey , String count_client) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmClient(
          uniqueKey: uniqueKey,
          count_client: count_client,

        ),
      ),
    );
  }
}

