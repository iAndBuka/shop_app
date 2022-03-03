import 'package:flutter/material.dart';
import 'package:shop_app/objects/lists.dart';
import 'package:shop_app/services/database_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    DataBaseService db = DataBaseService();
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(55, 66, 63, 1),
        title: Center(
            child: Text(
              "Profile",
              style:
              TextStyle(fontFamily: "Lato", fontSize: 25, color: Colors.white),
            )),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(55, 66, 63, 1),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: paddHeight*0.01),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: paddwidth*0.05),
                child: Text("Hi, User",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Lato",color: Colors.white),),
              ),
            ],
          ),

          ),

          Padding(
            padding: EdgeInsets.only(top: paddHeight * 0.01),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width*0.4,
                    height: size.height*0.3,
                    decoration: BoxDecoration(shape: BoxShape.circle,color:Color.fromRGBO(45, 54, 50, 1.0)),
                  child: Icon(Icons.person,color: Colors.white,size: 100,),
                  ),
                ],
              ),
            ),
          ),
          Text("User",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "Lato",color: Colors.white), ),
          Text("user@gmail.com",style: TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white), ),
          Padding(
            padding: EdgeInsets.only(top: paddHeight*0.1),
            child: Container(
              width: size.width*0.9,
              height: size.height*0.1,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Color.fromRGBO(45, 54, 50, 1.0) ),

              child: ElevatedButton(onPressed: (){
                _authService.logOut();
              },child: Text("Log out",style: TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(45, 54, 50, 1.0)),elevation: MaterialStateProperty.all(0)),),),
          )



        ],
      ),
    );
  }
}
