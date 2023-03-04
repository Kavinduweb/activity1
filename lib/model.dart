import 'package:firebase_database/firebase_database.dart';

class Recipe {
  String title;
  String description;
  List<String> ingredients;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients});

  Recipe.fromSnapshot(DataSnapshot snapshot) :
    title = snapshot.value["title"],
    description = snapshot.value["description"],
    ingredients = List<String>.from(snapshot.value["ingredients"]);

  toJson() {
    return {
      "title": title,
      "description": description,
      "ingredients": ingredients
    };
  }
}
