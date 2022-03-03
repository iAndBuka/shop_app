import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/functions/functions.dart';
import 'package:shop_app/objects/recipe.dart';
import 'package:shop_app/objects/user.dart';

List<Recipe> recipes = <Recipe>[];

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late StreamSubscription<List<Recipe>> recipeStreamSubscription;

  @override
  void dispose() {
    if (recipeStreamSubscription != null) {
      print('unsubscribing');
      recipeStreamSubscription.cancel();
    }
    super.dispose();
  }

  Future<void> loadData(AppUser user) async {
    var stream2 = getRecipe();
    recipeStreamSubscription = stream2.listen((List<Recipe> data) {
      recipes = data;
    });
  }

  Widget build(BuildContext context) {
    AppUser user = Provider.of<AppUser>(context);
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddwidth = MediaQuery.of(context).size.width;

    loadData(user);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(55, 66, 63, 1),
        title: Center(
            child: Text(
          "Recipes",
          style:
              TextStyle(fontFamily: "Lato", fontSize: 25, color: Colors.white),
        )),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(55, 66, 63, 1),
      body: Column(
        children: [
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("recipe")
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: paddHeight * 0.02,
                          left: paddwidth * 0.02,
                          right: paddwidth * 0.02),
                      child: ListView.builder(
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: paddHeight * 0.02,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromRGBO(55, 66, 63, 1)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          recipes[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          recipes[index].description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Lato",
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: size.width * 0.99,
                                      height: size.height * 0.3,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          recipes[index].imageAddress,
                                          fit: BoxFit.cover,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 5,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            launchURL(
                                                recipes[index].webAddress);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.web),
                                              Text("See recipe",
                                                  style: TextStyle()),
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: [
                                              Icon(Icons.share),
                                              Text(
                                                "Share recipe",
                                                style: TextStyle(),
                                              )
                                            ],
                                          ),
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
