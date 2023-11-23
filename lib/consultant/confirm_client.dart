import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'schedule_appoint.dart';

class ConfirmClient extends StatefulWidget {
  final String uniqueKey;
  ConfirmClient({required this.uniqueKey});

  @override
  State<ConfirmClient> createState() => _ConfirmClientState();
}

class _ConfirmClientState extends State<ConfirmClient> {

  Query dbRef = FirebaseDatabase.instance.ref().child('guser');
  Query dbRef2 = FirebaseDatabase.instance.ref().child('consultant');
  bool isConditionMet = false;

  Widget listItem({required Map guser, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap(
          guser['name'],
          guser['email'],
          guser['address'],
          guser['date_of_birth'],
          guser['check'],
          guser['occupation'],
          guser['phone'],
          guser['uniqueKey_consultant'],
          guser['uniqueKey_user'],
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
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guser['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              guser['email'],
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
          "Client Request",
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
                end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),

            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map guser = snapshot.value as Map;
                  //guser['uniqueKey_consultant']==widget.uniqueKey

                  if (guser['uniqueKey_consultant']==widget.uniqueKey && guser['check'] == "pending") {


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

  void navigateToDetailPage(String name, String email, String address,
      String date_of_birth, String check, String occupation, String phone,
      String uniqueKey_consultant, String uniqueKey_user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Schedule_Appoint(
          name: name,
          email: email,
          address: address,
          date_of_birth : date_of_birth,
          check: check,
          occupation: occupation,
          phone: phone,
          uniqueKey_consultant: uniqueKey_consultant,
          uniqueKey_user: uniqueKey_user,
        ),
      ),
    );
  }

}