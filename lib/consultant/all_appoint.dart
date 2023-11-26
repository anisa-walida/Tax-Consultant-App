import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'schedule_appoint.dart';

class AllClient extends StatefulWidget {
  final String uniqueKey;
  AllClient({required this.uniqueKey});

  @override
  State<AllClient> createState() => _AllClientState();
}

class _AllClientState extends State<AllClient> {

  Query dbRef = FirebaseDatabase.instance.ref().child('guser');
  Query dbRef2 = FirebaseDatabase.instance.ref().child('consultant');
  bool isConditionMet = false;
  int count = 0 ;
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
          guser['stime'],
          guser['sdate'],
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
              guser['sdate'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              guser['stime'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              guser['check'],
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
                sort: (a, b) {
                  // Custom sorting logic based on sdate and stime
                  Map guserDataA = a.value as Map;
                  Map guserDataB = b.value as Map;
                  String dateTimeA = "${guserDataA['sdate']} ${guserDataA['stime']}";
                  String dateTimeB = "${guserDataB['sdate']} ${guserDataB['stime']}";
                  return dateTimeA.compareTo(dateTimeB);
                },
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map guser = snapshot.value as Map;
                  //guser['uniqueKey_consultant']==widget.uniqueKey

                  if (guser['uniqueKey_consultant']==widget.uniqueKey && (guser['check'] == "current" || guser['check'] == "previous") ) {

                    count++;
                    return listItem(
                        guser: guser, onTap: navigateToDetailPage);
                  }
                  return Container();
                },
              ),
            ),
            if (count == 0)
              Container(
                child: Text("Nothing"),
              ),
          ],
        ),

      ),
    );

  }

  void navigateToDetailPage(String name, String email, String address,
      String date_of_birth, String check, String occupation, String phone,
      String uniqueKey_consultant, String uniqueKey_user,String stime, String sdate) {
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
          stime: stime,
          sdate: sdate,
        ),
      ),
    );
  }

}
