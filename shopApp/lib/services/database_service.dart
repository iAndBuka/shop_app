import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/objects/user.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;


  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<AppUser?> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User? user) => user != null ? AppUser.fromFirebase(user) : null);
  }
  Future<AppUser?> googleLogIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication = await  googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );
      try{
        final UserCredential userCredential = await _fAuth.signInWithCredential(credential);
        User? user = userCredential.user;
        return AppUser.fromFirebase(user!);
      } on FirebaseAuthException catch (e){
        print(e);
        return null;  }
    }
  }
  Future<AppUser?> facebookLogIn()async {
    final FacebookLogin fbLogin = FacebookLogin();



  }


}

