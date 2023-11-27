import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/screen/consultant_list_user.dart';
import 'user_form.dart';

class Appointment extends StatelessWidget {
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
  final String count_client;
  String? check;



  Appointment({required this.name, required this.email,
    required this.address,required this.degree,required this.fees,
    required this.password,required this.phone,required this.url,
    required this.uniqueKey, required  this.check, required this.schedule,
    required this.count_client,
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
                          '$name',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          ' $address',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$phone',
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
                          ' Degree:$degree ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          ' Email:$email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          ' Experience: Till now $count_client client ',
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


                // Clickable URL Row

                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the button horizontally
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('Button Pressed!');


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserForm(name: name, fees: fees, address: address, uniqueKey: uniqueKey)),
                        );
                      },
                      child: Text(
                        'Appointment',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black;
                          }
                          return Colors.black54;
                        }),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),

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
