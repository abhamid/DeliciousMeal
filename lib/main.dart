import 'dart:ui';

import 'package:flutter/material.dart';

import './screens/categories_page.dart';
import './screens/category_meals_page.dart';
import './screens/meal_detail_page.dart';
import './screens/top_tab_page.dart';
import './screens/bottom_tab_page.dart';
import './screens/filters_page.dart';
import './model/meal.dart';
import './data/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _saveFilters(Map<String, bool> selectedFilter) {
    setState(() {
      this._filters = selectedFilter;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavouriteMeal(String mealId) {
    int existingMealFavouriteIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingMealFavouriteIndex >= 0) {
      //remove the meal from favourites
      setState(() {
        _favouriteMeals.removeAt(existingMealFavouriteIndex);
      });
    } else {
      //Add the meal to favourites
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavourite(String mealId) {
    int existingMealFavouriteIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingMealFavouriteIndex >= 0) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delicious Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesPage(),
      routes: {
        //'/': (ctx) => CategoriesPage(),
        //'/': (ctx) => TopTabsPage(),
        '/': (ctx) => BottomTabPage(
              favouriteMeals: _favouriteMeals,
            ),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(
              availableMeals: this._availableMeals,
            ),
        MealDetailPage.routeName: (ctx) => MealDetailPage(
              toggleFavouriteMeal: _toggleFavouriteMeal,
              isMealFavourite: _isMealFavourite,
            ),
        FiltersPage.routeName: (ctx) => FiltersPage(
              filter: this._filters,
              saveFilters: this._saveFilters,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == MealDetailPage.routeName) {
        //   return MaterialPageRoute(builder: (context) {
        //     return MealDetailPage();
        //   });
        // }
        return MaterialPageRoute(builder: (context) {
          //return CategoriesPage();
          return BottomTabPage();
        });
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          //return CategoriesPage();
          return BottomTabPage();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Navigation Time!',
            ),
          ],
        ),
      ),
    );
  }
}
