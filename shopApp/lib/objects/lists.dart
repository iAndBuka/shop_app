import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/shop_list.dart';

import 'category.dart';

class Lists {
  static Product banana = Product(id: "1", name: "Banana", catId: "1");
  static Product cucumber = Product(id: "2", name: "Cucumber", catId: "1");
  static Product melon = Product(id: "3", name: "melon", catId: "1");
  static Product potato = Product(id: "4", name: "Potato", catId: "1");
  static Product tomato = Product(id: "5", name: "Tomato", catId: "1");

 static List<Product> fruitAndVeges = [banana,cucumber,melon,potato,tomato];


  static Category fruitsAndVeg =
      Category(id: "1", name: "Fruits and vegetables", list: fruitAndVeges);
  static Category breadAndPastries =
      Category(id: "2", name: "Bread and Pastries", list: []);
  static Category milkAndCheese =
      Category(id: "3", name: "Milk and cheese", list: []);
  static Category meatAndFish =
      Category(id: "4", name: "Meat and Fish", list: []);
  static Category beverages = Category(id: "5", name: "Beverages", list: []);

  static List a =  [
    fruitsAndVeg,
    breadAndPastries,
    milkAndCheese,
    meatAndFish,
    beverages
  ];
}
