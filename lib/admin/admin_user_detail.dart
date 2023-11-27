import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/screen/consultant_list_user.dart';


class UserDetail extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String uniqueKey_user;
  final String check;
  final String occupation;
  final String date_of_birth;
  final String uniqueKey_consultant;
  String? ucheck;


  UserDetail({required this.name, required this.email,
    required this.address,required this.phone,required this.uniqueKey_user,
    required this.check,required this.occupation,required this.date_of_birth,
    required this.uniqueKey_consultant,
  });

  @override
  Widget build(BuildContext context) {

    // Use the userKey as needed in your detail page
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,

        title: Text('Detail information of $name',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.transparent,
          ),
        ),
      ),
      /*
      body: Center(
        child: Text('User Key: $name\nemail: $email\n address: $address\ndegree: $degree\nfees:$fees\nphone:$phone\npassword: $password\n url: $url'),

      ),*/

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  hexStringToColor("ece2dc"),
                  hexStringToColor("d2b48c"),
                ],begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),

        child: Column(
          children: [
            // First Row
            Row(
              children: [

                Icon(
                  Icons.person,
                  color: Colors.brown,
                  size: 150,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  $name',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '  $address',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '  $phone',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Divider(height: 70.0, color: Colors.black,),
            // Empty Second Row

            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      ' Degree:  $occupation',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      ' Email:  $email',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      ' Email:  $date_of_birth',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),

                  ],
                ),
              ],
            ),
            // Empty Third Row

            SizedBox(height: 50),

            Divider(height: 70.0, color: Colors.black,),
            //Schedule




          ],
        ),

      ),
    );
  }



}