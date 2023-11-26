import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Previous_Client.dart';
class Previous_Client_Detail extends StatefulWidget {
  final String name;
  final String email;
  final String address;
  final String date_of_birth;
  final String check;
  final String occupation;
  final String phone;
  final String uniqueKey_consultant;
  final String uniqueKey_user;
  final String stime;
  final String sdate;


  Previous_Client_Detail({
    required this.name,
    required this.email,
    required this.address,
    required this.date_of_birth,
    required this.check,
    required this.occupation,
    required this.phone,
    required this.uniqueKey_consultant,
    required this.uniqueKey_user,
    required this.stime,
    required this.sdate,
  });

  @override
  State<Previous_Client_Detail> createState() => _Previous_Client_DetailState();
}

class _Previous_Client_DetailState extends State<Previous_Client_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,

        title: Text('Detail information of ${widget.name}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ),
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
                      '${widget.name}',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      ' ${widget.email}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${widget.phone}',
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
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      ' Occupation:${widget.occupation} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      ' Date_Of_Birth:${widget.date_of_birth}',
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
            SizedBox(height: 50),

            Divider(height: 70.0, color: Colors.black,),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 2.0), // Extra space on the left

                /*
                SizedBox(width: 16.0), // Adjust the width for the gap between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add your reject button logic here
                    print('Rejected!');
                    updateGuser_to_rejected(widget.uniqueKey_user);
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
                SizedBox(width: 2.0),
                // Extra space on the right
                 */
              ],
            )
          ],

        ),
      ),
    );
  }

/*
  Future<void> updateGuser_to_rejected(String uniqueKey_user) async {
    print('Updating consultant status with name: $uniqueKey_user');

    try {
      await Firebase.initializeApp();
      final databaseReference = FirebaseDatabase.instance.reference();

      // Replace 'consultants' with your actual Firebase database node
      await databaseReference.child('guser').child(uniqueKey_user).update({
        'check': 'rejected',
      });

      print('Consultant status updated successfully');
    } catch (error, stackTrace) {
      print('Failed to update consultant status: $error');
      print('Stack trace: $stackTrace');
    }
  }
*/
  void navigateToDetailPage(
      String uniqueKey) {
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
