import 'package:flutter/material.dart';
import 'package:mealapp/module/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/fav.dart';
import 'package:mealapp/widgets/maindrawer.dart';
class TabsScreen extends StatefulWidget {

  final List<Meal> FavMeal;

   TabsScreen( this.FavMeal) ;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override

  List <Map<String , Object>> pages ;

  void initState(){
    pages=[
    {
    'page' : CategoriesScreen(),
    'title': "Categories",
    },
    {
    'page' : FavScreen(widget.FavMeal),
    'title': "Favourites",
    }
    ];

    super.initState();
  }

  static int index = 0;
  void selectPage(int value) {
    setState(() {
      index = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(pages[index]['title']),
      ),
      body: pages[index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
