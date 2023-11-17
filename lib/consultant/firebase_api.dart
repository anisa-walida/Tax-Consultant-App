import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseApi{
  static UploadTask? uploadfile(String destination, File file)
  {

    try
    {

      final ref=FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);


    } on FirebaseException catch(e)
    {

      print("Exception occurred: $e");
      return null;
    }

  }
}