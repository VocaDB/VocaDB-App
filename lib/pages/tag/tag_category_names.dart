import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/pages/tag/tag_category_page.dart';
import 'package:vocadb/constants.dart';

class TagCategoryNames extends StatelessWidget {
  final Function onSelectCategory;
  final Function onSelectTag;

  const TagCategoryNames({Key key, this.onSelectCategory, this.onSelectTag})
      : super(key: key);

  Widget buildData(BuildContext context, List names) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            FlutterI18n.translate(
                                    context, 'label.category'),
            style: Theme.of(context).textTheme.title,
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
              children: List.generate(names.length, (index) {
                String name = names[index];
                return RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  onPressed: () => (onSelectCategory != null)
                      ? onSelectCategory(name)
                      : TagCategoryScreen.navigate(context, name,
                          onSelectTag: this.onSelectTag),
                  child: Text(name),
                );
              })),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildData(context, constTagCategories);
  }
}
