import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/objects/user.dart';
import 'bottom_navigator.dart';
import 'login_page.dart';
import 'login_with_page.dart';


class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppUser? user = Provider.of<AppUser?>(context);
    bool isLoggedIn = false;
    isLoggedIn = user != null;
    return isLoggedIn ?  const BottomBar() : const LoginWithPage();
  }
}
