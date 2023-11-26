import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/consultant/Previous_Client.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'Current_Client.dart';

class ClientList extends StatefulWidget {
  final String consultant_userUid;
  ClientList({required this.consultant_userUid});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  Query dbRef = FirebaseDatabase.instance.ref().child('consultant');
  bool isConditionMet = false;

  Widget listItem({required Map consultant, required Function onTap, required String txt}) {
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
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/checklist.png",
                width: 40,
                height: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                txt,
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
          "Client List",
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
            SizedBox(height: 60.0),
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
                        consultant: consultant, onTap: navigateToDetailPage ,txt: "Current Client List");
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(height: 20.0), // Adjust the spacing between the two lists
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef, // Use the same or different query as needed
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map consultant = snapshot.value as Map;
                  print(consultant['consultant_userUid']);
                  print(widget.consultant_userUid);

                  if (consultant['consultant_userUid'] ==
                      widget.consultant_userUid) {
                    return listItem(
                        consultant: consultant, onTap: navigateToDetailPage2,txt: "Previous Client List");
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

  void navigateToDetailPage(String uniqueKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrentClient(
          uniqueKey: uniqueKey,
        ),
      ),
    );
  }
  void navigateToDetailPage2(String uniqueKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviousClient(
          uniqueKey: uniqueKey,
        ),
      ),
    );
  }
}
