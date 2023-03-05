import 'package:flutter/material.dart';
import '../model/recipe.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

//ToDO Item list
class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final onDeleteRecipe;

  const RecipeItem(
      {Key? key, required this.recipe, required this.onDeleteRecipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        // leading: Icon(
        //   recipe.status? Icons.check_box: Icons.check_box_outline_blank,
        //   color:Colors.blue
        // ),
        title: Text(recipe.title!, //provide the taskname over here
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              // decoration: recipe.status? TextDecoration.lineThrough:null,
            )),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 7),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteRecipe(recipe.id);
            },
          ),
        ),
      ),
    );
  }
}
