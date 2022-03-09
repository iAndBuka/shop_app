import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/pages/login_with_page.dart';
import 'package:shop_app/pages/profile_page.dart';
import 'package:shop_app/pages/recipes_page.dart';
import 'package:shop_app/pages/shopping_list_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  final tabs = [ShoppingListPage(),RecipesPage(),ProfilePage()];
  @override
  Widget build(BuildContext context) {
    SnakeShape snakeShape = SnakeShape.circle;
    bool showSelectedLabels = false;
    bool shoUnselectedLabels = true;
    Color selectedGradient=
        const Color.fromARGB(55, 66, 63, 1);
    Color unSelectedGradient=
        const Color.fromARGB(255, 255, 255, 255) ;
    Color backGround=
        const Color.fromRGBO(45, 54, 50, 1.0);

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: tabs[_currentIndex],
        bottomNavigationBar: SnakeNavigationBar.color(
          backgroundColor: backGround,
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: snakeShape,
          snakeViewColor: selectedGradient,
          selectedItemColor:
          snakeShape == SnakeShapeType.indicator ? selectedGradient: null,
          unselectedItemColor: unSelectedGradient,
          showSelectedLabels: showSelectedLabels,
          showUnselectedLabels: shoUnselectedLabels,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined),label: LocaleKeys.list.tr()),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank_outlined),label: LocaleKeys.recipes.tr()),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: LocaleKeys.profile.tr()),

          ],
        ),
      ),
    );
  }
}
