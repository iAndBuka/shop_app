import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/check_user_page.dart';
import 'package:shop_app/services/database_service.dart';

import 'objects/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: ShopApp(),
  ));
}

class ShopApp extends StatefulWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  _ShopAppState createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        home: Check(),
      ),
    );
  }
}
