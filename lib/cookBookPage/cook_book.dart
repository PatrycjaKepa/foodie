import 'package:flutter/material.dart';
import 'package:foodie/cookBookPage/recipeList/user_recipe_list.dart';
import 'package:foodie/routesAndOthers/time_now.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:foodie/main.dart';
import 'package:http/http.dart' as http;

class CookBookPage extends StatefulWidget {
const CookBookPage({super.key});

  @override
  State<CookBookPage> createState() => _CookBookPageState();
}

class _CookBookPageState extends State<CookBookPage> {
  List<Map<String, dynamic>>_foundRecipes = [];
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _userRecipes = [];
  bool _isLoading = true;
  bool isOk = true;

   @override
  void initState() {
    super.initState();
    _fetchUserRecipes();
  }

  Future<void> _fetchUserRecipes() async {
    try{
      final response = await http.get(
        Uri.parse('http://$ADRES:8080/api/v1/recipe/userRecipes'),
        headers: {
          'Authorization': ACTIVE_USER.getAuthenticationKey(),
        },
      );
      if(response.statusCode == 200) {
        if(response.body == "Empty") {
          setState(() {
            _isLoading = false;
            isOk = false;
          });
        } else {
          setState(() {
            _userRecipes = List<Map<String, dynamic>>.from(json.decode(response.body));
            _foundRecipes = _userRecipes;
            _isLoading = false;
          });
        }
    
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (error) {
      print('Error fetching recipes: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if(enteredKeyword.isEmpty) {
      results = _userRecipes;
    } else {
      results = _userRecipes
        .where((recipe) =>
          recipe['name'] != null &&
          recipe['name'].toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();
    }
    setState(() {
      _foundRecipes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/addRecipe'), 
        child: const Icon(
          Icons.add, 
          color: Colors.white, 
          size: 28
        ),
      ),
      body: Center(
      child: Stack(
        children: [
            const TimeNow(),
            searchBox(),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 110),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Przepisy',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: isOk ? _recipeList() : const Text('Brak przepisów'),
                        ),
                  ],),
        ),
        ]),
              ),
        );
  }

  Widget _recipeList() {
    return UserRecipesList(userRecipes: _foundRecipes);
  }

Widget searchBox() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 350,
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey,
              )),
        ),
      ),
    ],
  );
}
}