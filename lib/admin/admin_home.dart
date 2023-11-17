import 'package:flutter/material.dart';
import 'package:tax_consultant/admin/admin_grid.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/admin_signin.dart';



class AdminHome extends StatelessWidget {
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
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 160),

            IconButton(
              icon: Icon(Icons.logout,
                color: Colors.white,
              ),

              onPressed: () {

                  print("Signed out");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminSignIn()),
                  );

              },
            ),
          ],
        ),
      ),
      body: Container(
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
                      SizedBox(width: 80),
                      Text(
                        "Admin Panel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'YoungSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),

            AdminGrid(),
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
