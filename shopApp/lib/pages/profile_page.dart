import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/objects/lists.dart';
import 'package:shop_app/services/database_service.dart';
import 'package:easy_localization/easy_localization.dart';

import '../objects/user.dart';
import '../translations/locale_keys.g.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AppUser user = Provider.of<AppUser>(context);
    AuthService _authService = AuthService();
    DataBaseService db = DataBaseService();
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;
    Border _borderEn = Border();
    Border _borderRu = Border();
    String _localeNow;
    String _locale = context.locale.toString();
    _localeNow = _locale;

    void changeLocale(String _locale) {
      setState(() {
        if (_locale == "en") {
          _localeNow = "en";
          context.setLocale(
            Locale('en'),
          );
        }
        if (_locale == "ru") {
          _localeNow = "ru";
          context.setLocale(
            Locale('ru'),
          );
        }
      });
    }

    void changeBorder() {
      setState(() {
        if (_localeNow == "en") {
          _borderEn = Border.all(color:Color.fromRGBO(55, 66, 63, 1), width: 3);
          _borderRu = Border();
        }
        if (_localeNow == "ru") {
          _borderRu = Border.all(color: Color.fromRGBO(55, 66, 63, 1), width: 3);
          _borderEn = Border();
        }
      });
    }

    changeBorder();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(55, 66, 63, 1),
        title: Center(
            child: Text(
              LocaleKeys.profile.tr(),
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
                child: Row(
                  children: [
                    Text(LocaleKeys.hi.tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Lato",color: Colors.white),),
                    Text(", User",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Lato",color: Colors.white),),
                  ],
                ),
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
              height: size.height * 0.1,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Color.fromRGBO(45, 54, 50, 1.0) ),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(45, 54, 50, 1.0)),elevation: MaterialStateProperty.all(0)),
                onPressed: () {
                  showDialog<String>(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                            builder: (context, StateSetter setState) {
                              return AlertDialog(
                                backgroundColor: Color.fromRGBO(55, 66, 63, 1).withOpacity(0.5),
                                title: Text(
                                    LocaleKeys.change_language.tr(),style: TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white)),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: size.width * 0.7,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20),
                                              color: Colors.white60,
                                              border: _borderRu),
                                          child: Center(
                                              child: Text(
                                                  "Русский",
                                                  style: TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white)
                                              )),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            changeLocale("ru");
                                            changeBorder();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: paddHeight * 0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            height: size.height * 0.1,
                                            width: size.width * 0.7,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    20),
                                                color: Colors.white60,
                                                border: _borderEn),
                                            child: Center(
                                                child: Text(
                                                    "English",
                                                    style: TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white)
                                                )),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              changeLocale("en");
                                              changeBorder();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      });
                },
                child: Container(
                  width: size.width * 0.97,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child:
                    Center(
                      child: Text(
                          LocaleKeys.change_language.tr(),
                          style:TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white)
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height*0.03,
          ),
          Container(
            width: size.width*0.9,
            height: size.height*0.1,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Color.fromRGBO(45, 54, 50, 1.0) ),

            child: ElevatedButton(onPressed: (){
              _authService.logOut();
            },child: Text(LocaleKeys.log_out.tr(),style: TextStyle(fontSize: 15,fontFamily: "Lato",color: Colors.white)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(45, 54, 50, 1.0)),elevation: MaterialStateProperty.all(0)),),),


        ],
      ),
    );
  }
}
