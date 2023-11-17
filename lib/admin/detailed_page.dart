import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'fetch_data.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String degree;
  final String fees;
  final String password;
  final String phone;
  final String url;
  final String uniqueKey;
  final String schedule;
  String? check;


  DetailPage({required this.name, required this.email,
    required this.address,required this.degree,required this.fees,
    required this.password,required this.phone,required this.url,
    required this.uniqueKey, required  this.check, required this.schedule,
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
            color: Colors.brown,
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
                  hexStringToColor("B69D74"),
                  hexStringToColor("402d21"),
                ],begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
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
                      '$name',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      ' $degree',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '$address',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Divider(height: 60.0, color: Colors.black,),
            // Empty Second Row

            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      '    Contact: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '       Email:$email',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '       Phone Number:$phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Empty Third Row
            Divider(height: 60.0, color: Colors.black,),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '    Fees:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '       $fees',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 60.0, color: Colors.black,),
            SizedBox(height: 10),

            //Schedule
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '    Schedule:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '       $schedule',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 60.0, color: Colors.black,),
            SizedBox(height: 10),




            // Clickable URL Row
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle URL navigation here, e.g., open a browser
                    launchURL('$url');
                  },

                  child: Text(
                    '          Click to Open URL',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 60.0, color: Colors.black,),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 2.0), // Extra space on the left
                ElevatedButton(
                  onPressed: () {
                    // Add your approve button logic here
                    print('Approved!');
                    print('$email');
                    print('$password');


                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email:'$email',
                      password:'$password',
                    ).then((value){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>FetchData()

                      ));
                      updateConsultantStatus();

                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");

                    });






                  },


                  child: Text(
                    'Approve',
                      style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.black54;
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          )
      ),
                ),

                SizedBox(width: 16.0), // Adjust the width for the gap between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add your reject button logic here
                    print('Rejected!');
                    deleteConsultant();
                  },


                child: Text(
                  'Reject',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.black54;
                    }),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                    )
                ),
                ),
                SizedBox(width: 2.0), // Extra space on the right
              ],
            )





          ],
        ),
        )
      ),
    );
  }
  Future<void> deleteConsultant() async {
    print('Deleting consultant with name: $uniqueKey');

    try {
      await Firebase.initializeApp();
      final databaseReference = FirebaseDatabase.instance.reference();

      // Replace 'consultants' with your actual Firebase database node
      await databaseReference.child('consultant').child(uniqueKey).remove();
      print('Consultant deleted successfully');
    } catch (error, stackTrace) {
      print('Failed to delete consultant: $error');
      print('Stack trace: $stackTrace');
    }
  }
  Future<void> updateConsultantStatus() async {
    print('Updating consultant status with name: $uniqueKey');

    try {
      await Firebase.initializeApp();
      final databaseReference = FirebaseDatabase.instance.reference();

      // Replace 'consultants' with your actual Firebase database node
      await databaseReference.child('consultant').child(uniqueKey).update({
        'check': 'Approved',
      });

      print('Consultant status updated successfully');
    } catch (error, stackTrace) {
      print('Failed to update consultant status: $error');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
