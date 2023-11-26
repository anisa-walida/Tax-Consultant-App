import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/admin/detailed_page.dart';
import 'my_consultant_detail.dart';

class SpecificClient extends StatefulWidget {
  final String consultant_uniqueKey;
  SpecificClient({required this.consultant_uniqueKey});

  @override
  State<SpecificClient> createState() => _SpecificClientState();
}

class _SpecificClientState extends State<SpecificClient> {

  Query dbRef = FirebaseDatabase.instance.ref().child('guser');
  Query dbRef2 = FirebaseDatabase.instance.ref().child('consultant');
  bool isConditionMet = false;
  int count = 0 ;
  Widget listItem({required Map consultant, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap(
            onTap(consultant['name'],consultant['email'],
              consultant['address'],consultant['degree'],
              consultant['fees'],consultant['password'],
              consultant['phone'],consultant['url'],consultant['uniqueKey'],consultant['check'],
              consultant['schedule'],
        ));
      },
      child: Container(
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
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              consultant['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              consultant['email'],
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
          "My Consultant",
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
                query: dbRef2,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map consultant = snapshot.value as Map;

                  print("#####################################################");
                  print('${widget.consultant_uniqueKey}'); // Access widget property here

                  if (consultant['uniqueKey'] == widget.consultant_uniqueKey) {
                    //count++;
                    return listItem(
                      consultant: consultant,
                      onTap: navigateToDetailPage,
                    );
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

  void navigateToDetailPage(String name, String email ,String address, String degree,String fees, String password, String phone,String url,String uniqueKey,String check,String schedule) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyConsultantDetail(
          name: name , email: email , address: address, degree: degree, fees: fees, password: password,phone: phone,url: url, uniqueKey:uniqueKey ,check:check, schedule: schedule,
        ),
      ),
    );
  }

}