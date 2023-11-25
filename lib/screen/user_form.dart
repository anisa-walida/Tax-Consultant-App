import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/home_screen.dart';
import 'package:file_picker/file_picker.dart';

import 'package:tax_consultant/consultant/button_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/get_user_gid.dart';

import 'dart:io';
class UserForm extends StatefulWidget {
   String name;
   String address;
   String fees;
   String uniqueKey;

  UserForm({required this.name, required this.fees, required this.address, required this.uniqueKey});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {







  String check="pending";
  String stime = "none";
  String sdate = "none";
  bool match=true;
  String? uniqueKey;
  //String uniquekey_user;
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();
  TextEditingController _addressTextController=TextEditingController();
  TextEditingController _phonenumberTextController=TextEditingController();
  TextEditingController _dateofbirthTextController=TextEditingController();
  TextEditingController _occupationTextController=TextEditingController();



  late DatabaseReference dbRef;
  @override
  void initState(){
  super.initState();
  dbRef = FirebaseDatabase.instance.ref().child('guser');
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
                  "Form",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Fill up this form to take an appointment",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Divider(height: 60.0, color: Colors.black,),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "Consultant Information",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row (
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
                          'Name: ${widget.name}',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Fees: ${widget.fees}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Location: ${widget.address}',
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

                Divider(height: 60.0, color: Colors.black,),




                Text(
                  "Client Information",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
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
                      Icons.person,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Date of Birth",
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
                    _dateofbirthTextController,
                ),
                SizedBox(
                  height: 30,
                ),

                // Fees
                Row(
                  children: [
                    Icon(
                      Icons.work,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(

                      "Occupation",
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
                    _occupationTextController,
                ),
                SizedBox(
                  height: 30,
                ),
                //Schedule

                SizedBox(
                  height: 30,
                ),



                ButtonWidget(
                  text: "Submit",
                  icon: Icons.upload,
                  onClicked: () async {
                    DatabaseReference newguserRef = dbRef.push();
                    String uniqueKey_user = newguserRef.key!;
                    String guser_userUid = UserInformation.guser_userUid;

                    Map<String, String> guser = {
                      'name': _userNameTextController.text,
                      'email': _emailTextController.text,
                      'address': _addressTextController.text,
                      'phone': _phonenumberTextController.text,
                      'date_of_birth': _dateofbirthTextController.text,
                      'occupation': _occupationTextController.text,
                      'uniqueKey_user': uniqueKey_user,
                      'uniqueKey_consultant': widget.uniqueKey,
                      'check': check,
                      'stime':stime,
                      'sdate':sdate,
                      'guser_userUid': guser_userUid,
                    };

                    await newguserRef.set(guser);
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
