import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MyConsultantDetail extends StatelessWidget {
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


  MyConsultantDetail({
    required this.name, required this.email,
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

                  ],
                ),
              ],
            ),
            // Empty Third Row

            SizedBox(height: 50),

            Divider(height: 70.0, color: Colors.black,),
            //Schedule


            // Clickable URL Row

            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the button horizontally
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Button Pressed!');
                    launchWhatsApp(context, phone);


                  },
                  child: Text(
                    'Contact Using Whats app',
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
              ],
            )

          ],
        ),

      ),
    );
  }

  void launchWhatsApp(BuildContext context, String num) async {
    // Replace '1234567890' with the recipient's phone number
    // and 'Hello' with your predefined message
    String phoneNumber = num;
    const message = "I am your assigned Client" ;

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
