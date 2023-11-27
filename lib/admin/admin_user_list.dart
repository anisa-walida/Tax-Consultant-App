import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'admin_user_detail.dart';

class UserListAdmin extends StatefulWidget {
  const UserListAdmin({super.key});

  @override
  State<UserListAdmin> createState() => _UserListAdminState();
}

class _UserListAdminState extends State<UserListAdmin> {
  Query dbRef = FirebaseDatabase.instance.ref().child('guser');

  Widget listItem({required Map guser, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap(
          guser['name'],
          guser['email'],
          guser['address'],
          guser['occupation'],
          guser['date_of_birth'],
          guser['uniqueKey_consultant'],
          guser['phone'],
          guser['uniqueKey_user'],
          guser['check'],
        );
// Pass the user's key when the card is clicked
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("ece2dc"),
            hexStringToColor("d2b48c"),
// hexStringToColor("483C32"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(
              10), // Adjust the radius for the desired circular shape
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
        backgroundColor: Colors.white,
        elevation: 0,
/*title: const Text("Consultant Request",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),*/
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("B69D74"),
              hexStringToColor("402d21"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              'User List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 16.0), // Add a SizedBox for spacing
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map guser = snapshot.value as Map;
                  if (guser['check'] != 'pending') {
                    return listItem(
                        guser: guser, onTap: navigateToDetailPage);
                  }
                  return Container(); // Return the result of listItem
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetailPage(
      String name,
      String email,
      String address,
      String phone,
      String uniqueKey_user,
      String check,
      String occupation,
      String date_of_birth,
      String uniqueKey_consultant
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetail(
            name: name,
            email: email,
            address: address,
            phone: phone,
            uniqueKey_user: uniqueKey_user,
            check: check,
            occupation: occupation,
            date_of_birth: date_of_birth,
            uniqueKey_consultant: uniqueKey_consultant
        ),
      ),
    );
  }
}
