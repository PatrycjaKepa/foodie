import 'package:flutter/material.dart';
import 'package:foodie/components/recipe_card.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/models/recipe_api.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}
class _RecipeViewState extends State<RecipeView> {

late List<Recipe> _recipes;
bool _isLoading = true;

void initState() {
  super.initState();
  getRecipes();
}

Future<void> getRecipes() async{
  _recipes = await RecipeApi.getRecipe();
  setState(() {
    _isLoading = false;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
