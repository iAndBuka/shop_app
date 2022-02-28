
class Product{
  late String id;
  late String name;
  late String catId;


  Product({
  required this.id,
    required this.name,
    required this.catId
});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "catId" : catId
    };
  }
  Product.fromJson(Map<String, dynamic> data){
    id = data["id"];
    name = data["name"];
    catId = data["catId"];
  }

}