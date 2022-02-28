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
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;
    return Scaffold( resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(55, 66, 63, 1),
    body: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: paddHeight*0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child:
              ElevatedButton(onPressed: () {_authService.logOut();},
                child: Text("Log out"),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: paddHeight*0.1),
        child: Row(children: [
          Container(
            child: ElevatedButton(
              onPressed: (){},
              child: Text("clocl"),
            ),
          )
        ],),
      ),
    ],),);
  }
}
