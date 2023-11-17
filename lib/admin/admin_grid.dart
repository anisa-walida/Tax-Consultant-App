import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'fetch_data.dart';

class AdminGrid extends StatelessWidget {
  AdminGrid({super.key});
  Item item1= new Item(
    title: "Approve Consultant",
    img: "assets/images/approve.png",
  );
  Item item2= new Item(
    title: "Update Tax Law",
    img: "assets/images/update-taxrules.png",
  );
  Item item3= new Item(
    title: "User List",
    img: "assets/images/user-list.png",
  );
  Item item4= new Item(
    title: "Consultant List",
    img: "assets/images/consultant-list.png",
  );
  @override
  Widget build(BuildContext context) {
    List<Item> MyList=[item1,item2,item3,item4];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16,right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children:
          MyList.map((data) {
            return GestureDetector(
                child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [

                      hexStringToColor("C3B091"),
                      hexStringToColor("483C32"),
                      // hexStringToColor("563d2d"),
                    ],begin: Alignment.topCenter, end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(data.img,width: 42,),
                  SizedBox(
                    height: 18,
                  ),
                  Text(data.title,style: TextStyle(
                    color: Colors.brown[100],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ),
              onTap: (){

                if(data == item1)
                {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>FetchData()
                  ));
                }

              },
                );

          }).toList()

      ),);
  }
}
class Item{
  String title;
  String img;
  Item({this.title = '', this.img ='',});
}