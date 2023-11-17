import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/screen/home_screen.dart';
import 'package:tax_consultant/admin/admin_home.dart';
class AdminSignIn extends StatefulWidget {
  const AdminSignIn({super.key});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();

  final String predefinedEmail = "anisa_jonaki@gmail.com";
  final String predefinedPassword = "6787";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  hexStringToColor("B69D74"),
                  hexStringToColor("402d21"),
                  //hexStringToColor("B69D74"),
                ],begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.width * 0.2, 20, 0),
            child: Column(
              children: <Widget>  [
                logoWidget("assets/images/admin-logo.png"),
                SizedBox(
                  height: 0.1,
                ),
                reusableTextField(
                  "Enter User Name",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),

                SizedBox(
                  height: 30,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                SizedBox(
                  height: 50,
                ),
                signInSignUpButton(context, true, () {
                  // Get the user's input
                  final enteredEmail = _emailTextController.text;
                  final enteredPassword = _passwordTextController.text;

                  // Compare with predefined values
                  if (enteredEmail == predefinedEmail &&
                      enteredPassword == predefinedPassword) {
                    // If the entered values match the predefined ones, navigate to the HomeScreen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>AdminHome()));
                  } else {
                    // If the entered values do not match, you can show an error message or handle it as needed.
                    print(
                        "Authentication failed. Please check your email and password.");
                  }
                }),
               // signUpOption(),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
