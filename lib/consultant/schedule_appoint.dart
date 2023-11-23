import 'package:flutter/material.dart';

class Schedule_Appoint extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String date_of_birth;
  final String check;
  final String occupation;
  final String phone;
  final String uniqueKey_consultant;
  final String uniqueKey_user;

  Schedule_Appoint({
    required this.name,
    required this.email,
    required this.address,
    required this.date_of_birth,
    required this.check,
    required this.occupation,
    required this.phone,
    required this.uniqueKey_consultant,
    required this.uniqueKey_user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Appointment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Address: $address", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Date of Birth: $date_of_birth", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Check: $check", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Occupation: $occupation", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Phone: $phone", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Consultant Key: $uniqueKey_consultant", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("User Key: $uniqueKey_user", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
