import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/screens/category_meal_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_detail.dart';
import 'package:mealapp/screens/tabs_screen.dart';

import 'module/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> Filterss = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'Vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> FavMeal = [];

  void setFilters(Map<String, bool> FilterData) {
    setState(() {
      Filterss = FilterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (Filterss['gluten'] == true && !meal.isGlutenFree == false) {
          return false;
        }
        if (Filterss['lactose'] == true && !meal.isLactoseFree == false) {
          return false;
        }
        if (Filterss['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (Filterss['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFav(String mealID) {
    final exixtingIndex = FavMeal.indexWhere((meal) => meal.id == mealID);
    if (exixtingIndex >= 0) {
      setState(() {
        FavMeal.removeAt(exixtingIndex);
      });
    } else {
      setState(() {
        FavMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isMealFav(String ID) {
    return FavMeal.any((meal) => meal.id == ID);
  }

  @override
  Widget build(BuildContext context) {
//intialization ll text stylle w el main theme colors f el app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blueAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      //law hst5dm pushName  f el nta2ol ben el screens lazm a3rf rout
      //home: MyHomePage(),
      routes: {
        '/': (context) => TabsScreen(FavMeal),
        CategoryMealScreen.routename: (context) =>
            CategoryMealScreen(availableMeal),
        MealDetail.routename: (context) => MealDetail(isMealFav, toggleFav),
        FiltersScreen.routename: (context) =>
            FiltersScreen(Filterss, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Application"),
      ),
      body: null,
    );
  }
}
