import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/pages/login_with_page.dart';
import 'package:shop_app/pages/shopping_list_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  final tabs = [ShoppingListPage()];
  @override
  Widget build(BuildContext context) {
    SnakeShape snakeShape = SnakeShape.circle;
    bool showSelectedLabels = false;
    bool shoUnselectedLabels = true;
    Gradient selectedGradient=
        const LinearGradient(colors: [Color.fromARGB(55, 66, 63, 1), Colors.white]);
    Gradient unSelectedGradient=
        const LinearGradient(colors: [Color.fromARGB(55, 66, 63, 1), Colors.white]);
    Gradient backGround=
        const LinearGradient(colors: [Color.fromARGB(55, 66, 63, 1), Colors.white]);

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: tabs[_currentIndex],
        bottomNavigationBar: SnakeNavigationBar.gradient(
          backgroundGradient: backGround,
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: snakeShape,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(12),
          snakeViewGradient: selectedGradient,
          selectedItemGradient:
          snakeShape == SnakeShapeType.indicator ? selectedGradient: null,
          unselectedItemGradient: unSelectedGradient,
          showSelectedLabels: showSelectedLabels,
          showUnselectedLabels: shoUnselectedLabels,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined),label: "List"),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank_outlined),label: "Recipes"),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined),label: "Profile"),

          ],
        ),
      ),
    );
  }
}
