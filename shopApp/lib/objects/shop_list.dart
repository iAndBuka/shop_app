
import 'package:shop_app/objects/product.dart';
import 'package:shop_app/services/database_service.dart';

class ShopList{
  late String? id;
  late String? author;
  late List<Product>? list;


  ShopList({
    this.id,
    this.author,
    this.list
});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "author": author,
      "list": list!.map((e) => e.toMap()).toList()
    };
  }
  ShopList.fromJson(String uid, Map<String, dynamic> data){
    id = data["id"];
    author = data['author'];
    list = (data["list"] as List).map((e) => Product.fromJson(e)).toList();
  }



  DataBaseService db = DataBaseService();

}