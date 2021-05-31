import 'package:flutter/material.dart';

import './catagories_tab_page.dart';
import './favourites_tab_page.dart';

class TopTabsPage extends StatefulWidget {
  @override
  _TopTabsState createState() => _TopTabsState();
}

class _TopTabsState extends State<TopTabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesTabPage(),
            FavouritesTabPage(),
          ],
        ),
      ),
    );
  }
}
