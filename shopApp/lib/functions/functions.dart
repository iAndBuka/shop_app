import 'package:shop_app/objects/category.dart';
import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/shop_list.dart';
import 'package:shop_app/objects/user.dart';
import 'package:shop_app/services/database_service.dart';

DataBaseService db = DataBaseService();



Stream<List<Category>> getCategories() {
  return db.getCategories();

}Stream<List<ShopList>> getList() {
  return db.getList();

}Stream<ShopList>  getShopList() {
  return db.getShopList();
}


void addList(List<Product> list, AppUser? user){
  ShopList a = ShopList(id:"1" ,author: user!.id, list: list);
  db.addList(a);
}


