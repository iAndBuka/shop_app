import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/shop_list.dart';
import 'package:shop_app/services/database_service.dart';

class Category{
  late String id;
  late String name;
  late List<Product> list;

  Category({
    required this.id,
    required this.name,
    required this.list
});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "list": list.map((e) => e.toMap()).toList()
    };
  }
  Category.fromJson(String id, Map<String, dynamic> data){
    id = data["id"];
    name = data["name"];
    list = (data["list"] as List).map((e) => Product.fromJson(e)).toList();
  }
}
