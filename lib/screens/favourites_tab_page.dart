import 'package:flutter/material.dart';

class FavouritesTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Favourites',
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
