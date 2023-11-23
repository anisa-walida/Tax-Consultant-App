import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/reusable_widgets/reusable_widget.dart';
import 'package:tax_consultant/screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// Your existing imports...

// Your existing imports...

// Your existing imports...

class TaxRules extends StatefulWidget {
  const TaxRules({Key? key}) : super(key: key);

  @override
  _TaxRulesState createState() => _TaxRulesState();
}

class _TaxRulesState extends State<TaxRules> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child('tax');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Tax Rules",
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
              children: <Widget>[
                // Your existing widgets...

                // Display Tax Information
                FutureBuilder<DatabaseEvent>(
                  future: dbRef.once(),
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                      return Text("No tax information available");
                    } else {
                      // Explicitly cast the value to Map<dynamic, dynamic>
                      Map<dynamic, dynamic> taxData = (snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: logoWidget("assets/images/tax_consultant_logo.png"),
                          ),
                          Text(
                            'Income Tax: ',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                          Text("${taxData['incometax']}",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),),
                          Text(
                            'Value Added Tax: ',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                              "${taxData['valueaddedtax']}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,)
                          ),
                          Text(
                            'Corporate Tax Rate: ',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                              "${taxData['corporatetax']}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              )
                          ),
                          Text(
                            'Tax Holidays:',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                              " ${taxData['taxholidays']}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,)
                          ),
                          Text(
                            'National Board of Revenue: ',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                              "National Board of Revenue: ${taxData['nationalboard']}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,)
                          ),
                          // Add more fields as needed
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}