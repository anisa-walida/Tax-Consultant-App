import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tax_consultant/consultant/consultant_grid.dart';
import 'package:tax_consultant/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/griddashboard.dart';
import 'package:tax_consultant/screen/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Consultant_HomeScreen extends StatelessWidget {
  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.home,
              color: Colors.brown,
            ),
            SizedBox(width: 10),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(width: 160),

            IconButton(
              icon: Icon(Icons.logout,
                color: Colors.brown,
              ),

              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed out");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: Container(
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
          children: [
            SizedBox(height: 110),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                          "assets/images/home_logo.png",
                        width: 350,
                        height: 100,
                      ),

                      Text(
                        "Consultant Panel",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 24,

                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),

            ConsultantGrid(),
          ],
        ),
      ),
    );
  }
/*_fetch() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)

      await  Firestore.instance.collection("User").document(firebaseUser.uid).get().then((ds) {
        userName = ds.data['email'];
        print(userName);

      }).catchError((e){
        print(e);
      });


  }*/


}

