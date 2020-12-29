import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: EdgeInsets.all(25),
        //Dummy categorie 3obar 3an list of objects w lazm tt7wl widget
        //w da 3an tare2 el mapping
        //3shan n3ml map
        //1. n3raf variable "cat data" hyd5ol gowa el dummy categories
        //3ashan n2dr na5od el data mn goa kol object
        //2. el decoration bta3t el grid n3mlha fe file lwa7dha
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(catData.id, catData.title, catData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //kol 3onsor 3ardo 200
          maxCrossAxisExtent: 200,
          //nsbet el ertfa3 bl nsba ll 3ard
          childAspectRatio: 3 / 2,
          //msafat ben el 3nasr
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
