import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../model/recipe.dart';
import '../widgets/recipe_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final recipesList =
      Recipe.recipeList(); //retrieve  the recipe list model into a variable
  final _recipeController = TextEditingController();
  List<Recipe> _foundRecipe = [];

  @override
  void initState() {
    _foundRecipe = recipesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 107, 131),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'All the Recipes',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      //Using Recipe widget and render the recipes
                      for (Recipe recipes in _foundRecipe.reversed)
                        RecipeItem(
                          onDeleteRecipe:
                              _deleteRecipeItem, //calling the delete function
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _recipeController,
                    decoration: InputDecoration(
                      hintText: 'Add a New Recipe',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _addRecipeItem(
                      _recipeController.text,
                    ); //calling add Recipe function
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //Add Recipe item function
  void _addRecipeItem(String recipe) {
    setState(() {
      recipesList.add(Recipe(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(), //Provide unique id
        title: recipe,
        description: recipe,
        ingredients: recipe,
      ));
    });
    _recipeController.clear();
  }

  //ToDo item delete function
  void _deleteRecipeItem(String id) {
    setState(() {
      recipesList.removeWhere((item) => item.id == id);
    });
  }

  //Create app bar section
  AppBar _buildAppBar() {
    return AppBar(backgroundColor: Colors.blue, title: Text('ToDo App'));
  }
}
