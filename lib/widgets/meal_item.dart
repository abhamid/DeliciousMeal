import 'package:flutter/material.dart';

import '../model/meal.dart';

import '../screens/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  //final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  //final List<String> ingredients;
  //final List<String> steps;
  //final bool isGlutenFree;
  //final bool isVegan;
  //final bool isVegetarian;
  //final bool isLactoseFree;
  //final Function onPressDeleteMeal;

  MealItem({
    @required this.id,
    //@required this.categories,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.duration,
    //@required this.ingredients,
    //@required this.steps,
    //@required this.isGlutenFree,
    //@required this.isVegan,
    //@required this.isVegetarian,
    //@required this.isLactoseFree,
    //@required this.onPressDeleteMeal,
  });

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailPage.routeName,
      arguments: {
        'id': this.id,
      },
    ).then((result) {
      // if (result != null && result is Map<String, Object>) {
      //   var id = result['id'];
      //   onPressDeleteMeal(id);
      // }
    });
  }

  String get _complexityText {
    switch (this.complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      default:
        return "UnKnown";
    }
  }

  String get _affordibilityText {
    switch (this.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "UnKnown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    this.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      this.title,
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${this.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${this._complexityText}'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${this._affordibilityText}'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
