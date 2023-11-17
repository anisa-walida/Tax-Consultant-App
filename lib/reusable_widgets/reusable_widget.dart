import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tax_consultant/consultant/consultant_register.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

UploadTask? task;
File? file ;
Image logoWidget(String imageName)
{
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 250,
    height: 420,
    //color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
TextEditingController controller)
{
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.brown[500],),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide:const BorderSide(
          width: 0,
          style: BorderStyle.none,
        )
      )

    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword:
    TextInputType.emailAddress,
  );
}


Container Consultant_TextField(bool isPasswordType,
    TextEditingController controller)
{
  return Container(
    height: 40.0,
   // alignment: Alignment.center,
    child: TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),

      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    ),
  );

}

Container signInSignUpButton(
BuildContext context, bool isLogin, Function onTap
) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(onPressed: () {
      onTap();
    },
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.brown[400];
            }
            return Colors.brown[700];
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          )
      ),

    ),
  );
}

/*  Container selectfile(
      BuildContext context, bool isLogin, Function onTap
      )
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
      ),
      child: ElevatedButton(onPressed: (){
        onTap(selectpdf());
      },
        child: Row(
          children: [
            Icon(
                Icons.file_open,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Select File",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if(states.contains(MaterialState.pressed))
              {
                return Colors.brown[400];
              }
              return Colors.brown[700];
            }),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            )
        ),

      ),
    );

}

Future selectpdf() async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);

  if(result==null) return();
  final path= result.files.single.path!;
  setState(() => file=File(path) );
}

*/