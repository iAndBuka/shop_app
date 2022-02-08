import 'package:flutter/material.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/services/database_service.dart';

AuthService _authService = AuthService();
Widget logo(Size size) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: size.height * 0.15,
              width: size.width * 0.4,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "EasyBag",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato"),
            )
          ],
        )
      ],
    ),
  );
}

Widget input(IconData icon, String hint, TextEditingController controller,
    bool obscure) {
  return Container(
    child: TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: "Lato"),
      decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.white60,
          ),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 1)),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )),
    ),
  );
}

Widget loginButton(String text, void func()) {
  return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(Colors.black)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromRGBO(31, 52, 56, 1),
            fontFamily: "Lato"),
      ),
      onPressed: () {
        func();
      });
}

Widget loginWithButtonMail(void func()) {
  return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.mail,
                size: 20,
                color: Color.fromRGBO(55, 66, 63, 1),
              ),
              SizedBox(width: 10),
              Text(
                "    Sign in with E-mail",
                style: TextStyle(
                    fontSize: 18, color: Colors.black, fontFamily: "Lato"),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
      onPressed: () {
        func();
      });
}

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                AppUser? user = await _authService.googleLogIn();

                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Image(
                    image: AssetImage("assets/google_logo.png"),
                    height: 20.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "    Sign in with Google",
                    style: TextStyle(
                        color: Color.fromRGBO(31, 52, 56, 1),
                        fontSize: 18,
                        fontFamily: "Lato"),
                  )
                ],
              ),
            ),
    );
  }
}

class FaceBookSignInButton extends StatefulWidget {
  @override
  _FaceBookSignInButtonState createState() => _FaceBookSignInButtonState();
}

class _FaceBookSignInButtonState extends State<FaceBookSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                AppUser? user = await _authService.googleLogIn();

                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Image(
                    image: AssetImage("assets/f_logo.png"),
                    height: 20.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "    Sign in with Facebook",
                    style: TextStyle(
                        color: Color.fromRGBO(31, 52, 56, 1),
                        fontSize: 18,
                        fontFamily: "Lato"),
                  )
                ],
              ),
            ),
    );
  }
}

class AppleSignInButton extends StatefulWidget {
  @override
  _AppleSignInButtonState createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                AppUser? user = await _authService.googleLogIn();

                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Image(
                    image: AssetImage("assets/apple_logo.png"),
                    height: 20.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "    Sign in with Apple",
                    style: TextStyle(
                        color: Color.fromRGBO(31, 52, 56, 1),
                        fontSize: 18,
                        fontFamily: "Lato"),
                  )
                ],
              ),
            ),
    );
  }
}
