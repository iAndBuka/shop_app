import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/check_user_page.dart';
import 'package:shop_app/services/database_service.dart';
import 'package:shop_app/translations/codegen_loader.g.dart';

import 'objects/lists.dart';
import 'objects/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
    path: 'assets/translations',
    assetLoader: CodegenLoader(),
    supportedLocales: [
      Locale('en'),
      Locale('ru')
    ],
    fallbackLocale: Locale('en'),
    child: MaterialApp(
      home: ShopApp(),
    ),
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
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        home: Check(),
      ),
    );
  }
}
