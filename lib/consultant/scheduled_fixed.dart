import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'confirm_client.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ScheduleFixed extends StatefulWidget {
  final String name;
  final String email;
  final String address;
  final String date_of_birth;
  final String check;
  final String occupation;
  final String phone;
  final String uniqueKey_consultant;
  final String uniqueKey_user;
  final String stime;
  final String sdate;

  ScheduleFixed({
    required this.name,
    required this.email,
    required this.address,
    required this.date_of_birth,
    required this.check,
    required this.occupation,
    required this.phone,
    required this.uniqueKey_consultant,
    required this.uniqueKey_user,
    required this.stime,
    required this.sdate,
  });

  @override
  State<ScheduleFixed> createState() => _ScheduleFixedState();

}

class _ScheduleFixedState extends State<ScheduleFixed> {
  TextEditingController _timeTextController = TextEditingController();
  TextEditingController _dateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Fixed Schedule",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
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
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.width * 0.2,
              20,
              0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                reusableTextField(
                  "Enter the time HH:MM (24 Hr)",
                  Icons.timer,
                  false,
                  _timeTextController,
                ),
                SizedBox(
                  height: 40,
                ),
                reusableTextField(
                  "Enter the date DD-MM-YYYY",
                  Icons.date_range,
                  false,
                  _dateTextController,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(width: 2.0), // Extra space on the left
                ElevatedButton(
                  onPressed: () async {
                    // Get the values from the controllers
                    String timeValue = _timeTextController.text;
                    String dateValue = _dateTextController.text;

                    // Pass values to the function
                    updateGuser_to_current(widget.uniqueKey_user, timeValue, dateValue);

                    // Navigate to the detail page
                    navigateToDetailPage(widget.uniqueKey_consultant);
                  },
                  child: Text(
                    'Approve',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.black54;
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateGuser_to_current(String uniqueKey_user, String timeValue, String dateValue) async {
    print('Updating consultant status with name: $uniqueKey_user');

    try {
      await FirebaseDatabase.instance.reference().child('guser').child(uniqueKey_user).update({
        'check': 'current',
        'stime': timeValue, // Update 'stime' field
        'sdate': dateValue, // Update 'sdate' field
      });

      print('Consultant status updated successfully');
    } catch (error, stackTrace) {
      print('Failed to update consultant status: $error');
      print('Stack trace: $stackTrace');
    }
  }

  void navigateToDetailPage(String uniqueKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmClient(
          uniqueKey: uniqueKey,
        ),
      ),
    );
  }
}



