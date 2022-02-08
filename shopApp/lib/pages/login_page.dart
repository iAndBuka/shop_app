import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop_app/functions/widgets.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/services/database_service.dart';

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
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(31, 52, 56, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: paddHeight * 0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                logo(),
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
                    child: input(Icons.email, "Please input your email",
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
                      "Please input your password", _passwordController, true))
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
                                  child: loginButton("Login", _loginbutton)),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: paddHeight * 0.04),
                                child: GestureDetector(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
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
                                  child: loginButton("Register", _registerbutton)),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: paddHeight * 0.04),
                                child: GestureDetector(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
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
    );
  }
}
