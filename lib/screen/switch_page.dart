import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tax_consultant/utils/color_utils.dart';
import 'package:tax_consultant/screen/signin_screen.dart';
import 'package:tax_consultant/admin/admin_signin.dart';
import 'package:tax_consultant/consultant/consultant_signin.dart';


class Switchs extends StatelessWidget {
  Switchs({super.key});

  Item item1= new Item(
    title: "Admin",
    img: "assets/images/as_admin.png",
  );

  Item item2= new Item(
    title: "Consultant",
    img: "assets/images/as_consultant.png",
  );

  Item item3= new Item(
    title: "User",
    img: "assets/images/as_user.png",

  );

  @override
  Widget build(BuildContext context) {
    List<Item> MyList=[item1,item2,item3];
    return Flexible(


        child: GridView.count(

            childAspectRatio: 1.0,
            padding: EdgeInsets.only(left: 100,right: 100),
            crossAxisCount: 1,
            crossAxisSpacing: 24,
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
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],

                  ),

                ),
                //Consulant_SignInScreen
                onTap: (){
                  if(data == item3)
                    {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>SignInScreen()
                      ));
                    }
                  if(data == item2)
                  {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>Consulant_SignInScreen()
                    ));
                  }
                  if(data == item1)
                  {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>AdminSignIn()
                    ));
                  }

                },
              );
            }).toList()

        ),
        /*
        onTap: (){
          showDialog(builder: (context) => new CupertinoAlertDialog(
              title: new Column(
                children: [
                  new Text("GridView"),
                  new Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
            ), barrierDismissible: false,
            context: context
          );
        },*/
      );
  }
}

class Item{
  String title;
  String img;
  Item({this.title = '', this.img ='',});
}




