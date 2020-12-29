import 'package:mealapp/module/meal.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  @override
  final String id;
  final String image;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeitem;

  const MealItem({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
   // @required this.removeitem,
  });

//la2n complexity no3ha enum w ana m7taga eni arg3ha f text fa balg2 ll get method
  String get complexitytext {
    switch (complexity) {
      case Complexity.Simple :
        return 'Simple';
        break;
      case Complexity.Challenging :
        return 'Challenging';
        break;
      case Complexity.Hard :
        return 'Hard';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable :
        return 'Affordable';
        break;
      case Affordability.Luxurious :
        return 'Luxurious';
        break;
      case Affordability.Pricey :
        return 'Pricey';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routename,
        arguments: id).then((result) {
      if (result != null) {
    //    removeitem(result);
      };
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
//bma eni ma2drsh a7ot el sora f mkan with curved borders hst5dm el clip
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(image,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text("$complexitytext"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text("$affordabilitytext"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
