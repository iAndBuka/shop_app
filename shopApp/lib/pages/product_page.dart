import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/functions/functions.dart';
import 'package:shop_app/objects/category.dart';
import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/shop_list.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/services/database_service.dart';
late Category category;
late String name;
late List products;
void open(Category a){
  category = a;
  name = a.name;
  products = a.list;
}
Set<Product> shopList = <Product>{};

class FruitsVegPage extends StatefulWidget {
  const FruitsVegPage({Key? key}) : super(key: key);

  @override
  _FruitsVegPageState createState() => _FruitsVegPageState();
}

class _FruitsVegPageState extends State<FruitsVegPage> {
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
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: paddHeight*0.1),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            Text(name,style: TextStyle(fontSize: 20,fontFamily: "Lato",color: Colors.white,fontWeight: FontWeight.bold),)
          ],),
        ),
        Expanded(child:
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: products.length ,
            itemBuilder: (context,index){
              return GestureDetector(onTap: (){
                shopList.add(products[index]);
                addList(shopList.toList(), user);
              },
                child: Card(
                  color:  Color.fromRGBO(45, 54, 50, 1.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 10,
                  child: Container(
                    child: Text(products[index].name, style: TextStyle(fontSize: 20,fontFamily: "Lato",fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                )

                );
        },



        )
        ),
      ],),
    );
  }
}
