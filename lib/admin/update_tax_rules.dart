import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/home_screen.dart';
import 'package:file_picker/file_picker.dart';

import 'package:tax_consultant/consultant/button_widget.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

class UpdateTax extends StatefulWidget {
  const UpdateTax({Key? key});

  @override
  State<UpdateTax> createState() => _UpdateTaxState();
}

class _UpdateTaxState extends State<UpdateTax> {
  TextEditingController _incometaxTextController = TextEditingController();
  TextEditingController _valueaddedtaxController = TextEditingController();
  TextEditingController _corporatetaxTextController = TextEditingController();
  TextEditingController _taxholidaysTextController = TextEditingController();
  TextEditingController _nationalboardofrevenueTextController =
  TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('tax');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.width * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/admin-logo.png"),
                Text(
                  "Tax Laws",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),


                // Name
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Income tax",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Admin_TextField(
                    _incometaxTextController
                ),
                SizedBox(
                  height: 30,
                ),

                // Email
                Row(
                  children: [

                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Value Added Tax",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Admin_TextField(
                  _valueaddedtaxController,

                ),
                SizedBox(
                  height: 30,
                ),


                // Address
                Row(
                  children: [

                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Corporate tax rate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Admin_TextField(
                  _corporatetaxTextController,
                ),
                SizedBox(
                  height: 30,
                ),


                // Phone Number
                Row(
                  children: [

                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Tax holidays",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Admin_TextField(
                    _taxholidaysTextController
                ),
                SizedBox(
                  height: 30,
                ),



                // Degrees
                Row(
                  children: [

                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "National Board of Revenue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Admin_TextField(
                    _nationalboardofrevenueTextController
                ),
                SizedBox(
                  height: 30,
                ),









                SizedBox(
                  height: 30,
                ),

                // ... (your other form fields)

                SizedBox(
                  height: 30,
                ),

                ButtonWidget(
                  text: "Upload",
                  icon: Icons.upload,
                  onClicked: () async {
                    // Upload the data to Firebase
                    await dbRef.set({
                      'incometax': _incometaxTextController.text,
                      'valueaddedtax': _valueaddedtaxController.text,
                      'corporatetax': _corporatetaxTextController.text,
                      'taxholidays': _taxholidaysTextController.text,
                      'nationalboard': _nationalboardofrevenueTextController.text,
                    });

                    // Show a confirmation message or perform other actions
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Tax information updated successfully"),
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}