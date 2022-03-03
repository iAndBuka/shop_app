import 'dart:async';

import 'package:shop_app/objects/category.dart';
import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/recipe.dart';
import 'package:shop_app/objects/shop_list.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/services/database_service.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';

DataBaseService db = DataBaseService();



Stream<List<Category>> getCategories() {
  return db.getCategories();

}Stream<List<ShopList>> getList() {
  return db.getList();

}Stream<ShopList>  getShopList() {
  return db.getShopList();
}
Stream<List<Recipe>>  getRecipe() {
  return db.getRecipe();
}



void addList(List<Product> list, AppUser? user){
  ShopList a = ShopList(id:"1" ,author: user!.id, list: list);
  db.addList(a);

}
void removeFromList(List<Product> list, AppUser? user){
  ShopList a = ShopList(id:"1" ,author: user!.id, list: list);
  db.addList(a);

}


/*class ListAdd {
static late ShopList a;

  static void addList(List<Product> list, AppUser? user) {
    late ShopList b;
    late List<Product> c;
    late List<Product> d;
    late StreamSubscription<ShopList> listStreamSubscription;
    var stream1 = getShopList();
    listStreamSubscription = stream1.listen((ShopList data) {
      ListAdd.a = data;
      listStreamSubscription.cancel();
    });
    listStreamSubscription.cancel();
    b = ListAdd.a;
    c = b.list!;
    c.addAll(list);
    d = c.toSet().toList();
    ShopList a = ShopList(id: "1", author: user!.id, list: d);
    db.addList(a);
  }
}*/

void launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
