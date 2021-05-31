import 'package:flutter/material.dart';

import '../screens/category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  const CategoryItem({
    this.id,
    this.title,
    this.bgColor,
  });

  // void _selectCategory(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return CategoryMealsPage(
  //           categoryId: this.id,
  //           categoryTitle: this.title,
  //         );
  //       },
  //     ),
  //   );
  // }

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsPage.routeName,
      arguments: {
        'id': this.id,
        'title': this.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.bgColor.withOpacity(0.7),
              this.bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
