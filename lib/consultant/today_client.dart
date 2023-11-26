import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'schedule_appoint.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'all_appoint.dart';

class TodayClient extends StatefulWidget {
  final String uniqueKey;
  TodayClient({required this.uniqueKey});

  @override
  State<TodayClient> createState() => _TodayClientState();
}

class _TodayClientState extends State<TodayClient> {
  DatabaseReference dbRef =
  FirebaseDatabase.instance.reference().child('guser');
  int count = 0;
  Map<String, bool> tappedItems = {}; // Keep track of tapped state

  Widget listItem({required Map guser, required Function onTap}) {
    String uniqueKey = guser['uniqueKey_user'];
    bool isTapped = tappedItems[uniqueKey] ?? false;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexStringToColor("f2ebe6"),
            hexStringToColor("C3B091"),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                guser['name'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                guser['sdate'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                guser['stime'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                guser['check'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(
                isTapped ? Icons.done_all : Icons.check,
                color: isTapped ? Colors.blue : null, // Change color if tapped
              ),
              onPressed: () {
                // Handle the icon click event here
                // For example, you can toggle between check and double-check icons
                onTap();
                // Update tapped state
                setState(() {
                  if (isTapped) {
                    tappedItems[uniqueKey] = false;
                  } else {
                    tappedItems[uniqueKey] = true;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,
        title: const Text(
          "Client Request",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        actions: [
          // Updated icon button with dropdown menu
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'showDetails') {
                // Add the functionality to navigate to another page here
                // For now, let's navigate to a hypothetical DetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AllClient(uniqueKey: widget.uniqueKey),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'showDetails',
                child: Text('Show Details'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  hexStringToColor("B69D74"),
                  hexStringToColor("402d21"),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                sort: (a, b) {
                  Map guserDataA = a.value as Map;
                  Map guserDataB = b.value as Map;
                  String dateTimeA =
                      "${guserDataA['sdate']} ${guserDataA['stime']}";
                  String dateTimeB =
                      "${guserDataB['sdate']} ${guserDataB['stime']}";
                  return dateTimeA.compareTo(dateTimeB);
                },
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map guser = snapshot.value as Map;

                  DateTime now = DateTime.now();
                  String dateString =
                      guser['sdate'] ?? ""; // Handle null or empty case
                  DateTime appointmentDate;

                  try {
                    appointmentDate =
                        DateFormat('dd-MM-yyyy').parse(dateString);
                  } catch (e) {
                    print("Error parsing date: $e");
                    return Container(); // Skip this item if date parsing fails
                  }

                  if (guser['uniqueKey_consultant'] == widget.uniqueKey &&
                      (guser['check'] == "current" ||
                          guser['check'] == "previous") &&
                      now.year == appointmentDate.year &&
                      now.month == appointmentDate.month &&
                      now.day == appointmentDate.day) {
                    count++;
                    return listItem(guser: guser, onTap: () {});
                  }
                  return Container();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}