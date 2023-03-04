import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
              ),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(
                labelText: "Ingredients",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addRecipe();
                Navigator.pop(context);
              },
              child: Text("Add Recipe"),
            ),
          ],
        ),
      ),
    );
  }

  void _addRecipe() {
    DatabaseReference recipeRef = FirebaseDatabase.instance.reference().child("recipes").push();
    Recipe recipe = Recipe(
      title: _titleController.text,
      description: _descriptionController.text,
      ingredients: _ingredientsController.text.split(","),
    );
    recipeRef.set(recipe.toJson());
    _titleController.clear();
    _descriptionController.clear();
    _ingredientsController.clear();
  }
}