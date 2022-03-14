import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/functions/functions.dart';
import 'package:shop_app/objects/category.dart';
import 'package:shop_app/objects/lists.dart';
import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/pages/bottom_navigator.dart';
import 'package:shop_app/services/database_service.dart';

late Category category;
late String name;
late List products;
void open(Category a) {
  category = a;
  name = a.name;
  products = a.list;
}

Set<Product> shopList = <Product>{};

Color cardColor = Color.fromRGBO(45, 54, 50, 1.0);
int _selectedIndex = -1;

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;
    AppUser user = Provider.of<AppUser>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(55, 66, 63, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: paddHeight * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Lists.shopList.add(products[index]);
                        addList(Lists.shopList, user);
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(cardColor)),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Colors.transparent,),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: size.width * 0.3,
                              height: size.height * 0.1,
                              child: Card(
                                color: cardColor,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                  products[index].image,
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                              ),
                            ),
                                Center(
                                  child: Container(
                                    child: Text(
                                      products[index].name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),

                          ],
                        ),
                      )),
                ),
              );
            },
          )),
          Padding(
            padding:  EdgeInsets.only(bottom: paddHeight*0.1),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent),elevation: MaterialStateProperty.all(0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => BottomBar()));
                    },
                    child: Text(
                      "Go back",
                      style: TextStyle(
                          fontFamily: "Lato", fontSize: 25, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
