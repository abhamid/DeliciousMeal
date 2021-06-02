import 'package:deliciousmeal/model/meal.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsPage({this.availableMeals});

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String _categoryId;
  String _categoryTitle;
  List<Meal> _dummyMeals;

  var _didDummyMealInitialised = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_didDummyMealInitialised) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryId = routeArgs['id'];
      _categoryTitle = routeArgs['title'];
      _dummyMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(_categoryId);
      }).toList();
      _didDummyMealInitialised = true;
    }

    super.didChangeDependencies();
  }

  void _doDeleteMealWithId(String mealId) {
    print('To Delete Meal with id: $mealId');
    setState(() {
      _dummyMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final mealItem = this._dummyMeals[index];
          return MealItem(
            id: mealItem.id,
            title: mealItem.title,
            affordability: mealItem.affordability,
            complexity: mealItem.complexity,
            imageUrl: mealItem.imageUrl,
            duration: mealItem.duration,
            //onPressDeleteMeal: _doDeleteMealWithId,
          );
        },
        itemCount: this._dummyMeals.length,
      ),
    );
  }
}
