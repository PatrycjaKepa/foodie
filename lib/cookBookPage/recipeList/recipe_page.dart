import 'dart:convert';
import 'package:flutter/material.dart';
import '../../main.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({required this.recipe, super.key});

  final Map<String, dynamic> recipe;

  Widget _ingredients() {
    final String jsonString = utf8.decode(recipe['ingredients'].codeUnits);
    List<Map<String, dynamic>> ingredients = List<Map<String, dynamic>>.from(json.decode(jsonString));

    return Column(
      children: 
        ingredients.map((ingredient) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Text(
                  "${ingredient['amount']} ${ingredient['unit']} ${ingredient['name']}",
                style: const TextStyle(fontSize: 16)
                ),
              ],
            ),
            );
        }).toList(),
      );
  }

  Widget _steps() {
    final String jsonString = utf8.decode(recipe['steps'].codeUnits);
    List <String> steps = List<String>.from(json.decode(jsonString));
    int index = 0;
    return Column(
      children:
        steps.map((step) {
          index++;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Text(
                  "$index. $step",
                style: const TextStyle(fontSize: 16)
                ),
              ],
            ),
            );
        }).toList(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name'] ?? 'Szczegóły przepisu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recipe['imagePath'] != null
                ? Image.network(
                    'http://$ADRES:8080/api/v1/recipe/wezipobierzmizdjencieproszuje/${recipe['imagePath']}',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.food_bank)),
                  ),
            const SizedBox(height: 16),
            Text(
              recipe['name'] ?? 'Brak nazwy',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Porcje: ${recipe['servings'] ?? 'N/A'} os"),
            Text("Czas przygotowania: ${recipe['duration'] ?? 'N/A'} min"),
            const SizedBox(height: 16),
            const Text("Składniki:"),
            _ingredients(),
            
            const SizedBox(height: 16),
            const Text("Przygotowanie"),
            _steps(),
          ],
        ),
      ),
    );
  }
}