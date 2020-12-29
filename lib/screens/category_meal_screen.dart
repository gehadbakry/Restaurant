import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routename = 'category_meals';

  final List<Meal> availableM ;

   CategoryMealScreen(this.availableM);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override

String categoryTitle;
  var categoryMeals;

  didChangeDependencies(){
    //3ashan a2dr awsal ll data aly bmrrha m3 el navigation

    final routArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];

    //where btsa3dni a filter el ma3lomat aly bt722 shart mo3ian ba3en bt7oto f list
    //categoryMeal hia list kamla feha 3nasr mo3ina
     categoryMeals = widget.availableM.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealID){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id==mealID);
    });
  }


  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            image: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          //  removeitem: removeMeal,

          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
