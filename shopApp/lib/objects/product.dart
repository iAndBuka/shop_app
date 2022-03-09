
class Product{
  late String id;
  late String name;
  late String catId;
  late String image;


  Product({
  required this.id,
    required this.name,
    required this.catId,
    required this.image
});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "catId" : catId,
      "image" : image
    };
  }
  Product.fromJson(Map<String, dynamic> data){
    id = data["id"];
    name = data["name"];
    catId = data["catId"];
    image = data["image"];
  }

}