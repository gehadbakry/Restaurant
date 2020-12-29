import 'package:flutter/material.dart';
import 'package:mealapp/widgets/maindrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = "/filters";

  final Function savefilter;
  final Map<String , bool> currentFilter;
   FiltersScreen(this.currentFilter ,this.savefilter) ;


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

//  @override
//  initState(){
//     isGlutenFree = widget.currentFilter['gluten'];
//     isLactoseFree = widget.currentFilter['lactose'];
//     isVegan = widget.currentFilter['vegan'];
//     isVegetarian = widget.currentFilter['vegetarian'];
//    super.initState();
//  }

  Widget buildSwitchTile(String title , String sub , bool current ,Function update){
    return
        SwitchListTile(
          title: Text(title),
          value: current,
          subtitle: Text(sub),
          onChanged: update,

    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
               final Map<String , bool> selecterFilter= {
                  'gluten':isGlutenFree,
                  'lactose':isLactoseFree,
                  'vegan':isVegan,
                  'Vegetarian':isVegetarian,
                };
                widget.savefilter(selecterFilter);
                },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile("Gluten Free", "Only includes Gluten free meals",
                isGlutenFree, (value){
                  setState(() {
                    isGlutenFree = value;
                  });
                },),
              buildSwitchTile("Lactose Free", "Only includes Lactose free meals",
                isLactoseFree, (value){
                  setState(() {
                    isLactoseFree = value;
                  });
                },),
              buildSwitchTile("Vegan", "Only includes Vegan meals",
                isVegan, (value){
                  setState(() {
                    isVegan = value;
                  });
                },),
              buildSwitchTile("Vegetarian", "Only includes Vegetarian meals",
                isVegetarian, (value){
                  setState(() {
                    isVegetarian = value;
                  });
                },),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
