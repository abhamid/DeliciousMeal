import 'package:flutter/material.dart';

import '../screens/filters_page.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildDrawerMenuItem({
    IconData menuIcon,
    String menuTitle,
    Function tabHandler,
  }) {
    return ListTile(
      leading: Icon(
        menuIcon,
        size: 26,
      ),
      title: Text(
        menuTitle,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildDrawerMenuItem(
              menuIcon: Icons.restaurant,
              menuTitle: 'Meals',
              tabHandler: () =>
                  Navigator.of(context).pushReplacementNamed('/')),
          _buildDrawerMenuItem(
              menuIcon: Icons.settings,
              menuTitle: 'Filters',
              tabHandler: () => Navigator.of(context)
                  .pushReplacementNamed(FiltersPage.routeName)),
        ],
      ),
    );
  }
}
