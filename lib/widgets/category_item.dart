import 'package:flutter/material.dart';
import 'package:mealapp/main.dart';
import 'package:mealapp/screens/category_meal_screen.dart';
class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

//haza el widget yst2bl kol id w title w color w y7awl ynsk tare2t el 3ard
   CategoryItem( this.id, this.title, this.color) ;

//l2nha tst3ml navigation n7tag ll buildcontext
   void selectcategory(BuildContext ctx){
     Navigator.of(ctx).pushNamed(CategoryMealScreen.routename,
     arguments: {
       'id':id,
         'title': title,
         },
     );
   }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //3ashan el function de btsahl walia 3ard data 3and el da8t
      onTap: () => selectcategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              color.withOpacity(0.3),
              color,
            ] ,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
