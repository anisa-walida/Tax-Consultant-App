import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/griddashboard.dart';
import 'package:tax_consultant/screen/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_consultant/screen/home_screen.dart';
import 'package:tax_consultant/screen/signin_screen.dart';
import 'package:tax_consultant/screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA_7rb_f9qzsTROyEaWsEZG9w1-UmKKXQU",
        appId: "1:832492667580:android:9b58bc0c4ccf6f6b9646b9",
        messagingSenderId: "832492667580",
        projectId: "tax-consultant-479e0",
      storageBucket: "tax-consultant-479e0.appspot.com",
    ),
  );

  runApp(MaterialApp(
    home: splash(),
  ));
}

