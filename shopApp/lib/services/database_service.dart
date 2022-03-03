import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/objects/category.dart';
import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/recipe.dart';
import 'package:shop_app/objects/shop_list.dart';
import 'package:shop_app/objects/user.dart';


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

}


class DataBaseService{
  final CollectionReference _productsCollection = FirebaseFirestore.instance.collection('products');
  final CollectionReference _listCollection = FirebaseFirestore.instance.collection('list');
  final CollectionReference _categoryCollection = FirebaseFirestore.instance.collection('category');
  final CollectionReference _recipeCollection = FirebaseFirestore.instance.collection('recipe');

  Future addCategory(Category category) async{
    return await _categoryCollection.doc(category.id).set(category.toMap());

  } Future addRecipe(Recipe recipe) async{
    return await _recipeCollection.doc(recipe.id).set(recipe.toMap());

  }
  Stream<List<Category>> getCategories(){
    return _categoryCollection.snapshots().map((QuerySnapshot data) =>
        data.docs.map((DocumentSnapshot doc) => Category.fromJson(doc.id,doc.data() as Map<String, dynamic>)).toList());

  }
  Stream<List<Recipe>> getRecipe(){
    return _recipeCollection.snapshots().map((QuerySnapshot data) =>
        data.docs.map((DocumentSnapshot doc) => Recipe.fromJson(doc.id,doc.data() as Map<String, dynamic>)).toList());

  }

  Future addList(ShopList list) async{
    return await _listCollection.doc(list.id).set(list.toMap());

  }
  Stream<List<ShopList>> getList(){
    return _listCollection.snapshots().map((QuerySnapshot data) =>
        data.docs.map((DocumentSnapshot doc) => ShopList.fromJson(doc.id,doc.data() as Map<String, dynamic>)).toList());

  }

  Stream<ShopList> getShopList(){
   // var docSnapshot = _listCollection.doc("1").get();
    //var a = docSnapshot.
    return _listCollection.doc("1").snapshots().map((DocumentSnapshot doc) => ShopList.fromJson(doc.id,doc.data() as Map<String, dynamic>));
  }

}

