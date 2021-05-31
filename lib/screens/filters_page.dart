import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filter';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  Widget _buildFilterItem(
      {String titleText,
      String subTitleText,
      bool switchValue,
      Function onChangedHandler}) {
    return SwitchListTile(
      title: Text(titleText),
      subtitle: Text(subTitleText),
      value: switchValue,
      onChanged: onChangedHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildFilterItem(
                  titleText: 'Gluten Free',
                  subTitleText: 'Only Include Gluten Free Meals',
                  switchValue: this._glutenFree,
                  onChangedHandler: (newValue) {
                    setState(() {
                      this._glutenFree = newValue;
                    });
                  },
                ),
                _buildFilterItem(
                  titleText: 'Lactose Free',
                  subTitleText: 'Only Include Lactose Free Meals',
                  switchValue: this._lactoseFree,
                  onChangedHandler: (newValue) {
                    setState(() {
                      this._lactoseFree = newValue;
                    });
                  },
                ),
                _buildFilterItem(
                  titleText: 'Only Vegan',
                  subTitleText: 'Only Include Vegan Meals',
                  switchValue: this._vegan,
                  onChangedHandler: (newValue) {
                    setState(() {
                      this._vegan = newValue;
                    });
                  },
                ),
                _buildFilterItem(
                  titleText: 'Only Vegetarian',
                  subTitleText: 'Only Vegetarian Meals',
                  switchValue: _vegetarian,
                  onChangedHandler: (newValue) {
                    setState(() {
                      this._vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
