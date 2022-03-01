import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/shop_list.dart';

import 'category.dart';

class Lists {
  static Product banana = Product(id: "1", name: "Banana", catId: "1");
  static Product cucumber = Product(id: "2", name: "Cucumber", catId: "1");
  static Product melon = Product(id: "3", name: "melon", catId: "1");
  static Product potato = Product(id: "4", name: "Potato", catId: "1");
  static Product tomato = Product(id: "5", name: "Tomato", catId: "1");
  static Product bread = Product(id: "6", name: "Bread", catId: "2");
  static Product buns = Product(id: "7", name: "Buns", catId: "2");
  static Product donuts = Product(id: "8", name: "Donuts", catId: "2");
  static Product pie = Product(id: "9", name: "Pie", catId: "2");
  static Product croissant = Product(id: "10", name: "Croissant", catId: "2");
  static Product butter = Product(id: "11", name: "Butter", catId: "3");
  static Product milk = Product(id: "12", name: "Milk", catId: "3");
  static Product cheese = Product(id: "13", name: "Cheese", catId: "3");
  static Product eggs = Product(id: "14", name: "Eggs", catId: "3");
  static Product feta = Product(id: "15", name: "Feta", catId: "3");
  static Product bacon = Product(id: "16", name: "Bacon", catId: "4");
  static Product beef = Product(id: "17", name: "Beef", catId: "4");
  static Product ham = Product(id: "18", name: "Ham", catId: "4");
  static Product lamb = Product(id: "19", name: "Lamb", catId: "4");
  static Product chicken = Product(id: "20", name: "Chicken", catId: "4");
  static Product juice = Product(id: "21", name: "Juice", catId: "5");
  static Product coffee = Product(id: "22", name: "Coffee", catId: "5");
  static Product cola = Product(id: "23", name: "Cola", catId: "5");
  static Product energy = Product(id: "24", name: "Energy drink", catId: "5");
  static Product water = Product(id: "25", name: "Water", catId: "5");

 static List<Product> fruitAndVeges = [banana,cucumber,melon,potato,tomato];
 static List<Product> breadPastries = [bread,buns,donuts,pie,croissant];
 static List<Product> milkCheese = [butter,milk,cheese,eggs,feta];
 static List<Product> meatFish = [bacon,beef,ham,lamb,chicken];
 static List<Product> beverage = [juice,coffee,cola,energy,water];



  static Category fruitsAndVeg =
      Category(id: "1", name: "Fruits and vegetables", list: fruitAndVeges);
  static Category breadAndPastries =
      Category(id: "2", name: "Bread and Pastries", list: breadPastries);
  static Category milkAndCheese =
      Category(id: "3", name: "Milk and cheese", list: milkCheese);
  static Category meatAndFish =
      Category(id: "4", name: "Meat and Fish", list: meatFish);
  static Category beverages = Category(id: "5", name: "Beverages", list: beverage);



    
  static List a =  [
    fruitsAndVeg,
    breadAndPastries,
    milkAndCheese,
    meatAndFish,
    beverages
  ];
}
