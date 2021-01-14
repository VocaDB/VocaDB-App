import 'package:flutter/material.dart';
import 'package:vocadb_app/constants.dart';
import 'package:get/get.dart';

/// A widget displays list of tag categories with fixed values from [constTagCategories]
class TagCategoryList extends StatelessWidget {
  final Function(String) onSelectCategory;

  const TagCategoryList({Key key, this.onSelectCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'category'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: GridView.count(
              primary: true,
              crossAxisCount: 2,
              childAspectRatio: 3,
              padding: EdgeInsets.all(8.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(constTagCategories.length, (index) {
                String name = constTagCategories[index];
                return RaisedButton(
                  color: Theme.of(context).cardColor,
                  onPressed: () => this.onSelectCategory(name),
                  child: Text(name),
                );
              })),
        )
      ],
    );
  }
}
