import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routename = 'MealDetail';
  final Function toggleFav;
  final Function IsFav;

  MealDetail(this.IsFav, this.toggleFav);

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute
        .of(context)
        .settings
        .arguments as String;
//awl ma yla2y object y7a22 el shart keda SelectedMel msh list kamla
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(SelectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingrediants",
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.black12,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        SelectedMeal.ingredients[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount: SelectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Steps",
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(SelectedMeal.steps[index]),

                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: SelectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        //3ashan a3ml delete ll meal
        // Navigator.of(context).pop(mealID)

        onPressed: () => toggleFav(mealID),
        child: Icon(
          IsFav(mealID) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
