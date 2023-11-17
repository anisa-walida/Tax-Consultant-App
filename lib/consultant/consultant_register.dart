
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/home_screen.dart';
import 'package:file_picker/file_picker.dart';

import 'package:tax_consultant/consultant/button_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_api.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';


class consultant_reg extends StatefulWidget {
  const consultant_reg({super.key});


  @override
  State<consultant_reg> createState() => _consultant_regState();

}

class _consultant_regState extends State<consultant_reg> {

  UploadTask? task;
  String? urlDownload;
  String UserPdf='';
  String check="pending";
  bool match=true;
  String? uniqueKey;
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();
  TextEditingController _addressTextController=TextEditingController();
  TextEditingController _phonenumberTextController=TextEditingController();
  TextEditingController _degreesTextController=TextEditingController();
  TextEditingController _feesTextController=TextEditingController();
  TextEditingController _scheduleTextController=TextEditingController();



  late DatabaseReference dbRef;
  @override
  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('consultant');
  }
  @override
  Widget build(BuildContext context) {
    final fileName = file!=null ? basename(file!.path):'No file selected';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*
        title: const Text("Sign Up",
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
            gradient: LinearGradient(
                colors: [
                  hexStringToColor("F5F5EF"),
                  hexStringToColor("C2B280"),
                  hexStringToColor("B69D74"),
                ],begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.width * 0.2, 20, 0),
            child: Column(
              children: <Widget>  [
               // logoWidget("assets/images/tax_consultant_logo.png"),
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.brown,
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
                    Icon(
                      Icons.person_2_outlined,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Full Name",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _userNameTextController
                ),
                SizedBox(
                  height: 30,
                ),

                // Email
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Email",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _emailTextController,

                ),
                SizedBox(
                  height: 30,
                ),


                // Address
                Row(
                  children: [
                    Icon(
                      Icons.add_location,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Address",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _addressTextController
                ),
                SizedBox(
                  height: 30,
                ),


                // Phone Number
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Phone Number",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _phonenumberTextController
                ),
                SizedBox(
                  height: 30,
                ),



                // Degrees
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Professional Qualification",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _degreesTextController
                ),
                SizedBox(
                  height: 30,
                ),

                // Fees
                Row(
                  children: [
                    Icon(
                      Icons.money,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Your expected fees",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _feesTextController
                ),
                SizedBox(
                  height: 30,
                ),
                //Schedule
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Enter Schedule (Time)",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _scheduleTextController
                ),
                SizedBox(
                  height: 30,
                ),
                // Password
                Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Password",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Consultant_TextField(
                    false,
                    _passwordTextController
                ),
                SizedBox(
                  height: 30,
                ),


                SizedBox(
                  height: 30,
                ),



                Text(
                  match?"Rename the CV with your username":"Wrong file name",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                ButtonWidget(
                  text: "Add CV",
                  icon: Icons.attach_file,
                  onClicked: () {
                    selectpdf(context);
                  },
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  fileName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),
                ),


                SizedBox(
                  height: 30,
                ),

                ButtonWidget(
                  text: "Submit",
                  icon: Icons.upload,
                  onClicked: () async {

                    uploadfile();
                    DatabaseReference newConsultantRef = dbRef.push();
                    String uniqueKey = newConsultantRef.key!;

                    Map<String, String> consultant = {
                      'name': _userNameTextController.text,
                      'email': _emailTextController.text,
                      'address': _addressTextController.text,
                      'phone': _phonenumberTextController.text,
                      'degree': _degreesTextController.text,
                      'fees': _feesTextController.text,
                      'password': _passwordTextController.text,
                      'url': urlDownload.toString(),
                      'uniqueKey': uniqueKey,
                      'check': check,
                      'schedule' : _scheduleTextController.text,
                    };

                    await newConsultantRef.set(consultant);
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

  Future selectpdf(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      // Show a toast message for "No file selected"
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No file selected"),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final path = result.files.single.path!;

    setState(() {
      file = File(path);
    });
    UserPdf =_userNameTextController.text;
    UserPdf+=".pdf";
    if(UserPdf!=basename(file!.path))
    {
        print("MATCHED");
        match = false;
    }


    // Show a toast message for "CV Added"
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("CV Added"),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future uploadfile() async {
    if(file==null)return;
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
   // FirebaseApi.uploadfile(destination,file!);
    task = FirebaseApi.uploadfile(destination,file!);

  if(task==null) return;
  final snapshot=await task!.whenComplete((){});
  urlDownload= await snapshot.ref.getDownloadURL();
  print('Download Link: $urlDownload');

  }


}


