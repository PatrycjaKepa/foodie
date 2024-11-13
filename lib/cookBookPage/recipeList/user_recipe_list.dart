import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:foodie/cookBookPage/recipeList/recipe_page.dart';

class UserRecipesList extends StatelessWidget {
  final List<Map<String, dynamic>> userRecipes;

  const UserRecipesList({super.key, required this.userRecipes});

  void _openRecipeDetails(BuildContext context, Map<String, dynamic> recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipePage(recipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
              itemCount: userRecipes.length,
              itemBuilder: (context, index) {
                final recipe = userRecipes[index];
                return GestureDetector(
                  onTap: () => _openRecipeDetails(context, recipe),
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'http://$ADRES:8080/api/v1/recipe/wezipobierzmizdjencieproszuje/${recipe['imagePath']}', // Sprawdź czy `imageUrl` istnieje
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe['name'] ?? 'Brak nazwy',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text("Servings: ${recipe['servings'] ?? 'N/A'}"),
                              Text("Duration: ${recipe['duration'] ?? 'N/A'} min"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}