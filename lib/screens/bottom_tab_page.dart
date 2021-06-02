import 'package:flutter/material.dart';

import './catagories_tab_page.dart';
import './favourites_tab_page.dart';
import '../widgets/main_drawer.dart';
import '../model/meal.dart';

class BottomTabPage extends StatefulWidget {
  final List<Meal> favouriteMeals;

  BottomTabPage({this.favouriteMeals});

  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Catagories',
        'page': CategoriesTabPage(),
      },
      {
        'title': 'Favourites',
        'page': FavouritesTabPage(
          favouriteMeals: widget.favouriteMeals,
        ),
      },
    ];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              'Category',
            ),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            title: Text(
              'Favourites',
            ),
          ),
        ],
      ),
    );
  }
}
