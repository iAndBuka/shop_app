import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/functions/widgets.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/services/database_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

class LoginWithPage extends StatelessWidget {
  const LoginWithPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _withMail(){
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const LoginPage()));
    }

    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.yellow.withOpacity(0.7), BlendMode.dstATop),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(55, 66, 63, 1),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  logo(size),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: paddHeight*0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: size.width * 0.9,
                      height: size.height * 0.06,
                      child: loginWithButtonMail(_withMail))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight*0.05),
              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(right: paddwidth*0.05,left: paddwidth*0.05),
                    child: Container(child: Divider(color: Colors.white,thickness: 2,)),
                  )),
                  Text(LocaleKeys.or.tr(),style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "Lato"),),
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(right: paddwidth*0.05,left: paddwidth*0.05),
                    child: Container(child: Divider(color: Colors.white,thickness: 2,)),
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Container(
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    child: GoogleSignInButton())],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Container(
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    child: FaceBookSignInButton())],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Container(
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    child: AppleSignInButton())],
              ),
            )
          ],
        ),
      ),
    );
  }
}
