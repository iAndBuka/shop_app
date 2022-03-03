import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/functions/functions.dart';
import 'package:shop_app/functions/widgets.dart';
import 'package:shop_app/objects/category.dart';
import 'package:shop_app/objects/shop_list.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/pages/product_page.dart';
import 'package:shop_app/services/database_service.dart';


List categories = <Category>[];
List shopList1 = <ShopList>[];
ShopList? a ;
late bool checkList;

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  late StreamSubscription<List<Category>> categoryStreamSubscription;
  late StreamSubscription<ShopList> listStreamSubscription;
  @override
  void dispose() {
    if (categoryStreamSubscription != null) {
      print('unsubscribing');
      categoryStreamSubscription.cancel();
    }
    if(listStreamSubscription !=null){
      listStreamSubscription.cancel();
    }
    super.dispose();
  }

  Future<void> loadData(AppUser user) async {
    var stream1=  getShopList();
    listStreamSubscription = stream1.listen((ShopList data) {
      a = data;
    });
    var stream = getCategories();
    categoryStreamSubscription = stream.listen((List<Category> data) {
      categories = data;
    });
  }

  Widget build(BuildContext context) {
    if (a==null){
        checkList = false;
    }else if(a!.list!.isEmpty){
      checkList = false;
    }else {
      checkList= true;
    }

    AuthService _authService = AuthService();
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;
    AppUser user = Provider.of<AppUser>(context);
    loadData(user);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(55, 66, 63, 1) ,
        title: Center(child: Text("Home",style: TextStyle(fontFamily: "Lato",fontSize: 25,color: Colors.white),)),),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(55, 66, 63, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: paddHeight*0.05,left: paddwidth*0.03),
            child: Row(
              children: [
                Container(child: Text("You need to buy",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "Lato"),),),
              ],
            ),
          ),
          (checkList ?  MediaQuery.removePadding(context: context,
              removeTop: true,
              removeBottom: true
              ,child:
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('list').doc('1').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot){
                  return ListViewWidget(user: user);
                }
              )

          ): NothingWidget(size: size)),

          MediaQuery.removePadding(context: context,removeTop: true,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('category').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot){
                  return Padding(
                    padding:  EdgeInsets.only(top: paddHeight*0.05),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    itemCount: categories.length
                    ,itemBuilder: (context,index){
                      return Padding(
                        padding:  EdgeInsets.only(right: 10,left: 10,bottom: 5),
                        child: GestureDetector(
                          onTap: (){
                            open(categories[index]);
                            Navigator.push(
                              context, MaterialPageRoute(builder: (ctx) => ProductsPage()));},
                          child: Container(
                            height: size.height*0.08,
                            width: size.width*0.7,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color.fromRGBO(38, 60, 54, 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: size.width*0.9,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(categories[index].name.toString(),style: TextStyle(color: Colors.white,fontFamily: "Lato",fontSize: 20,fontWeight: FontWeight.bold),),
                                      Text(">",style: TextStyle(color: Colors.white,fontFamily: "Lato",fontSize: 20,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    ),
                  );
                },



              ))

        ],),
      ),
    );

  }
}
