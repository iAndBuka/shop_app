import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop_app/functions/widgets.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/pages/login_with_page.dart';
import 'package:shop_app/services/database_service.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  late String _email;
  late String _password;
  bool showLogin = true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;

    void _loginbutton() async {
      _email = _emailController.text;
      _password = _passwordController.text;
      if (_email.isEmpty || _password.isEmpty) return;
      AppUser? user = await _authService.signInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        showToast(
          "Sign in failed",
          textStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.white12,
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      } else {
        Navigator.pop(context);
        _emailController.clear();
        _passwordController.clear();
      }

    }

    void _registerbutton() async {
      _email = _emailController.text;
      _password = _passwordController.text;
      if (_email.isEmpty || _password.isEmpty) return;
      AppUser? user = await _authService.registerWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        showToast(
          "Register  failed",
          textStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.white12,
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      } else {
        Navigator.pop(context);
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.yellow.withOpacity(0.7), BlendMode.dstATop),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(55, 66, 63, 1.0),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  logo(size),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: size.width * 0.9,
                      height: size.height * 0.1,
                      child: input(Icons.email, LocaleKeys.input_email.tr(),
                          _emailController, false))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: size.width * 0.9,
                    height: size.height * 0.1,
                    child: input(Icons.password_rounded,
                        LocaleKeys.input_password.tr(), _passwordController, true))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: (showLogin
                          ? Column(
                              children: [
                                Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.07,
                                    child: loginButton(LocaleKeys.login.tr(), _loginbutton)),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: paddHeight * 0.04),
                                  child: GestureDetector(
                                    child: Text(
                                      LocaleKeys.register.tr(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,fontFamily: "Lato"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        showLogin = false;
                                      });
                                    },
                                  ),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.07,
                                    child: loginButton(LocaleKeys.register.tr(), _registerbutton)),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: paddHeight * 0.04),
                                  child: GestureDetector(
                                    child: Text(
                                      LocaleKeys.login.tr(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,fontFamily: "Lato"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        showLogin = true;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
