class Recipe{
  late String id;
  late String name;
  late String description;
  late String imageAddress;
  late String webAddress;



  Recipe({required this.id, required this.name, required this.description ,required this.imageAddress, required this.webAddress});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "imageAddress": imageAddress,
      "webAddress" : webAddress
    };
  }
  Recipe.fromJson(String id,Map<String, dynamic> data){
    id = data["id"];
    name = data["name"];
    description = data["description"];
    imageAddress = data["imageAddress"];
    webAddress = data["webAddress"];
  }

}