import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import 'ingredient_list.dart';
import 'add_basic_info.dart';
import 'upload_photo.dart';
import 'step_list.dart';
import 'package:go_router/go_router.dart';


class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _servingController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  List<Map<String, dynamic>> ingredients = [];
  final List<String> units = ['gram', 'kilogram', 'miligram', 'sztuk', 'szczypt', 'litr', 'mililitr'];

  List<String> steps = [];
  Uint8List? imageBytes; 

  void _addIngredient() {
    setState(() {
      ingredients.add({
        'name' : '',
        'amount': '',
        'unit': 'gram',
      });
    });
  }

  void _addStep() {
    setState(() {
      steps.add('');
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      ingredients.removeAt(index);
    });
  }

  void _removeStep(int index) {
    setState(() {
      steps.removeAt(index);
    });
  }

  void _reorderIngredients(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = ingredients.removeAt(oldIndex);
      ingredients.insert(newIndex, item);
    });
  }

  void _reorderSteps(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = steps.removeAt(oldIndex);
      steps.insert(newIndex, item);
    });
  }

  Future<void> submitRecipe() async {
    if (!_formKey.currentState!.validate()) return;

    String ingredientsJson = jsonEncode(ingredients);
    String stepsJson = jsonEncode(steps);

    String basicAuth = ACTIVE_USER.getAuthenticationKey();

    var request = http.MultipartRequest(
      'POST', 
      Uri.parse('http://$ADRES:8080/api/v1/recipe/addRecipe'),
      );

    request.headers['Authorization'] = basicAuth;

    request.fields['name'] = _nameController.text;
    request.fields['servings'] = int.parse(_servingController.text).toString();
    request.fields['duration'] = int.parse(_durationController.text).toString();
    request.fields['ingredients'] = ingredientsJson;
    request.fields['steps'] = stepsJson;

    if (imageBytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        imageBytes!,
        filename: 'recipe_image.jpg',
      ));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      context.go('/bottomBar');
    } else {
      throw Exception('Failed to add recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dodaj Przepis"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Dodanie widgetu do wgrywania zdjęcia
                UploadPhoto(
                  onImagePicked: (Uint8List? image) {
                    setState(() {
                      imageBytes = image; // Przechowujemy wybrane zdjęcie
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Dodanie widgetu z podstawowymi informacjami
                AddBasicInfo(
                  nameController: _nameController,
                  servingController: _servingController,
                  durationController: _durationController,
                ),
                const SizedBox(height: 20),

                // Dodanie widgetu ze składnikami
                IngredientList(
                  ingredients: ingredients,
                  units: units,
                  addIngredient: _addIngredient,
                  removeIngredient: _removeIngredient,
                  reorderIngredients: _reorderIngredients,
                ),
                const SizedBox(height: 20),

                // Dodanie widgetu z krokami
                StepList(
                  steps: steps,
                  addStep: _addStep,
                  removeStep: _removeStep,
                  reorderSteps: _reorderSteps,
                ),
                const SizedBox(height: 20),

                // Przycisk zapisania przepisu
                ElevatedButton(
                  onPressed: submitRecipe,
                  child: const Text('Zapisz przepis'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
