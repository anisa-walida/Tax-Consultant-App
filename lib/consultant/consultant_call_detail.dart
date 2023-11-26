import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Current_Client.dart';
import 'package:url_launcher/url_launcher.dart';
class Call_Detail extends StatefulWidget {
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


  Call_Detail({
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
  State<Call_Detail> createState() => _Call_DetailState();
}

class _Call_DetailState extends State<Call_Detail> {
  @override
  Widget build(BuildContext context) {
    String phone =widget.phone;
    String email=widget.email;
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 2.0), // Extra space on the left
                  ElevatedButton(
                    onPressed: () async {
                     // navigateToDetailPage( widget.uniqueKey_user);
                      launchWhatsApp(context, phone);
                    },




                    child: Text(
                      'Contact Using WhatsApp',
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
                  ElevatedButton(
                    onPressed: () {
                      print('Button Pressed!');
                      launchEmail(context, email);


                    },
                    child: Text(
                      'Contact Using Mail',
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
                  ElevatedButton(
                    onPressed: () {
                      print('Button Pressed!');
                      launchCall(context, phone);


                    },
                    child: Text(
                      'Emergency Call',
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
              ),
            )
          ],

        ),
      ),
    );
  }


  void navigateToDetailPage(
      String uniqueKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrentClient(
          uniqueKey: uniqueKey,
        ),
      ),
    );
  }
  void launchWhatsApp(BuildContext context, String num) async {
    // Replace '1234567890' with the recipient's phone number
    // and 'Hello' with your predefined message
    String phoneNumber = num;
    const message = "I am your assigned Consultant" ;

    final url = "https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      await launch("https://play.google.com/store/apps/details?id=com.whatsapp");
      print('Error launching WhatsApp: $e');
      // Handle the error as needed
    }
  }
  void launchEmail(BuildContext context, String mail) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '$mail@example.com',
      queryParameters: {'subject': 'Your Subject', 'body': 'Your Body'},
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }
  void launchCall(BuildContext context, String num) async {
    final Uri _phoneCallUri = Uri(scheme: 'tel', path: '$num');

    if (await canLaunch(_phoneCallUri.toString())) {
      await launch(_phoneCallUri.toString());
    } else {
      throw 'Could not launch phone call';
    }
  }
}
