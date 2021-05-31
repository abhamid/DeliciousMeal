import 'dart:ui';

import 'package:flutter/material.dart';

import './screens/categories_page.dart';
import './screens/category_meals_page.dart';
import './screens/meal_detail_page.dart';
import './screens/top_tab_page.dart';
import './screens/bottom_tab_page.dart';
import 'screens/filters_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (ctx) => BottomTabPage(),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetailPage.routeName: (ctx) => MealDetailPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(),
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
