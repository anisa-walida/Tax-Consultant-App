import 'package:flutter/material.dart';
import 'package:tax_consultant/screen/signin_screen.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/switch_page.dart';
import 'package:tax_consultant/screen/switch_screen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 4000),(){} );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SwitchScreen()));
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
            children: <Widget>  [
            logoWidget("assets/images/tax_consultant_logo.png"),
      ]),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2B280), // Set the background color to brown
      body: Center( // Center the image vertically and horizontally
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoWidget("assets/images/splash.png"),
          ],
        ),
      ),
    );
  }

}
