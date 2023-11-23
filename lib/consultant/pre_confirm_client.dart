import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
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
    return GestureDetector(
      onTap: () {
        onTap(
          consultant['uniqueKey'],
        );
      },
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              consultant['name'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              consultant['email'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
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
              hexStringToColor("B69D74"),
              hexStringToColor("402d21"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
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
      String uniqueKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmClient(
          uniqueKey: uniqueKey,
        ),
      ),
    );
  }
}
