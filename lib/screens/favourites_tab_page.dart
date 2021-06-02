import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesTabPage extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesTabPage({this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    return this.favouriteMeals.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, index) {
              final mealItem = this.favouriteMeals[index];
              return MealItem(
                id: mealItem.id,
                title: mealItem.title,
                affordability: mealItem.affordability,
                complexity: mealItem.complexity,
                imageUrl: mealItem.imageUrl,
                duration: mealItem.duration,
                //onPressDeleteMeal: () {},
              );
            },
            itemCount: this.favouriteMeals.length,
          )
        : Center(
            child: Text(
              'You have no favourites yet - start adding some!',
              style: Theme.of(context).textTheme.title,
            ),
          );
  }
}
