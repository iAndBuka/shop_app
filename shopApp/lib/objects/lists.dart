import 'package:shop_app/objects/product.dart';
import 'package:shop_app/objects/recipe.dart';
import 'package:shop_app/objects/shop_list.dart';

import 'category.dart';

class Lists {
  static Product banana = Product(id: "1", name: "Banana", catId: "1",image: 'assets/banana.png');
  static Product cucumber = Product(id: "2", name: "Cucumber", catId: "1",image: 'assets/banana.png');
  static Product melon = Product(id: "3", name: "melon", catId: "1",image: 'assets/banana.png');
  static Product potato = Product(id: "4", name: "Potato", catId: "1",image: 'assets/banana.png');
  static Product tomato = Product(id: "5", name: "Tomato", catId: "1",image: 'assets/banana.png');
  static Product bread = Product(id: "6", name: "Bread", catId: "2",image: 'assets/banana.png');
  static Product buns = Product(id: "7", name: "Buns", catId: "2",image: 'assets/banana.png');
  static Product donuts = Product(id: "8", name: "Donuts", catId: "2",image: 'assets/banana.png');
  static Product pie = Product(id: "9", name: "Pie", catId: "2",image: 'assets/banana.png');
  static Product croissant = Product(id: "10", name: "Croissant", catId: "2",image: 'assets/banana.png');
  static Product butter = Product(id: "11", name: "Butter", catId: "3",image: 'assets/banana.png');
  static Product milk = Product(id: "12", name: "Milk", catId: "3",image: 'assets/banana.png');
  static Product cheese = Product(id: "13", name: "Cheese", catId: "3",image: 'assets/banana.png');
  static Product eggs = Product(id: "14", name: "Eggs", catId: "3",image: 'assets/banana.png');
  static Product feta = Product(id: "15", name: "Feta", catId: "3",image: 'assets/banana.png');
  static Product bacon = Product(id: "16", name: "Bacon", catId: "4",image: 'assets/banana.png');
  static Product beef = Product(id: "17", name: "Beef", catId: "4",image: 'assets/banana.png');
  static Product ham = Product(id: "18", name: "Ham", catId: "4",image: 'assets/banana.png');
  static Product lamb = Product(id: "19", name: "Lamb", catId: "4",image: 'assets/banana.png');
  static Product chicken = Product(id: "20", name: "Chicken", catId: "4",image: 'assets/banana.png');
  static Product juice = Product(id: "21", name: "Juice", catId: "5",image: 'assets/banana.png');
  static Product coffee = Product(id: "22", name: "Coffee", catId: "5",image: 'assets/banana.png');
  static Product cola = Product(id: "23", name: "Cola", catId: "5",image: 'assets/banana.png');
  static Product energy = Product(id: "24", name: "Energy drink", catId: "5",image: 'assets/banana.png');
  static Product water = Product(id: "25", name: "Water", catId: "5",image: 'assets/banana.png');

 static List<Product> fruitAndVeges = [banana,cucumber,melon,potato,tomato];
 static List<Product> breadPastries = [bread,buns,donuts,pie,croissant];
 static List<Product> milkCheese = [butter,milk,cheese,eggs,feta];
 static List<Product> meatFish = [bacon,beef,ham,lamb,chicken];
 static List<Product> beverage = [juice,coffee,cola,energy,water];

  static List<Product> shopList = <Product>[];

  static void removeFromShopList(int index){
    shopList.removeAt(index);
}



  static Category fruitsAndVeg =
      Category(id: "1", name: "Fruits and vegetables", list: fruitAndVeges);
  static Category breadAndPastries =
      Category(id: "2", name: "Bread and Pastries", list: breadPastries);
  static Category milkAndCheese =
      Category(id: "3", name: "Milk and cheese", list: milkCheese);
  static Category meatAndFish =
      Category(id: "4", name: "Meat and Fish", list: meatFish);
  static Category beverages = Category(id: "5", name: "Beverages", list: beverage);

  static Recipe beefStew = Recipe(id: "1", name: "Beef Stew V", description: "A charming beef stew flavored with red wine and vegetables.",
      imageAddress: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F49121.jpg&w=272&h=272&c=sc&poi=face&q=60",
      webAddress: "https://www.allrecipes.com/recipe/23152/beef-stew-v/");
  static Recipe blueBerryBreakfast= Recipe(id: "2", name: "Blueberry Lemon Breakfast", description: "Sweet blueberries and tart lemon pair well in this alternative to oatmeal.",
      imageAddress: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F958126.jpg&w=272&h=272&c=sc&poi=face&q=60",
      webAddress: "https://www.allrecipes.com/recipe/230830/blueberry-lemon-breakfast-quinoa/");
  static Recipe lemonade= Recipe(id: "3", name: "Best Lemonade Ever", description: "Lemonade is a very refreshing drink, and this is the best one ever!",
      imageAddress: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2021%2F10%2F27%2FLemonade.jpg&w=272&h=272&c=sc&poi=face&q=60",
      webAddress: "https://www.allrecipes.com/recipe/32385/best-lemonade-ever/");


  static List<Recipe> b = [
    beefStew,blueBerryBreakfast,lemonade
  ];
    
  static List a =  [
    fruitsAndVeg,
    breadAndPastries,
    milkAndCheese,
    meatAndFish,
    beverages
  ];
}
