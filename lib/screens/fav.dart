import 'package:flutter/material.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class FavScreen extends StatelessWidget {

  final List<Meal> FavMeal;

  FavScreen(this.FavMeal);


  @override
  Widget build(BuildContext context) {
    if (FavMeal.isEmpty) {
      return Center(
        child: Text("Add your favs here "),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: FavMeal[index].id,
            title: FavMeal[index].title,
            image: FavMeal[index].imageUrl,
            duration: FavMeal[index].duration,
            affordability: FavMeal[index].affordability,
            complexity: FavMeal[index].complexity,
            // removeitem: removeMeal,

          );
        },
        itemCount: FavMeal.length,
      );
    }
  }
}
