import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/home_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.brown,
        minimumSize: Size.fromHeight(50),
      ),
        onPressed: onClicked,
        child:buildContent());
  }
  Widget buildContent() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon,size:28),
      SizedBox(
        width: 16,
      ),
      Text(
          text,
        style:TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),

    ],
  );
}
