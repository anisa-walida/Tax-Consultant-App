import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/screen/switch_page.dart';

class SwitchScreen extends StatefulWidget {
  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  String? userName;

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
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                  ),
                ],
              ),
            ),

            SizedBox(height: 100),

            Switchs(),
          ],
        ),
      ),
    );
  }
}