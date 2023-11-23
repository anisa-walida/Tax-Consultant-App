import 'package:flutter/material.dart';
import 'package:tax_consultant/consultant/consultant_home.dart';
import 'package:tax_consultant/consultant/consultant_register.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/screen/home_screen.dart';

class Consulant_SignInScreen extends StatefulWidget {
  const Consulant_SignInScreen({super.key});

  @override
  State<Consulant_SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<Consulant_SignInScreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                logoWidget("assets/images/tax_consultant_logo.png"),
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
                signInSignUpButton(context, true, () async {
                  try {
                    UserCredential userCredential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );

                    String consultant_userUid = userCredential.user?.uid ?? "";
                    print('User UID: $consultant_userUid');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Consultant_HomeScreen(consultant_userUid: consultant_userUid),
                      ),
                    );
                  } catch (error) {
                    print("Error ${error.toString()}");
                    // Handle the error as needed
                  }
                }),
                signUpOption(),
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
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
          style: TextStyle(
            color: Colors.white70,
          ),),
        GestureDetector(onTap: (){
          Navigator.push(
              context,MaterialPageRoute(builder: (context)=>consultant_reg())
          );
        },
          child: const Text(
            " Sign Up ",
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold,
            ),
          ),
        )

      ],
    );
  }
}


