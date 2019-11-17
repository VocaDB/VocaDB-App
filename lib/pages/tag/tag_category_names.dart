import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/tag_bloc.dart';
import 'package:vocadb/pages/tag/tag_category_page.dart';
import 'package:vocadb/services/tag_rest_service.dart';
import 'package:vocadb/widgets/center_content.dart';

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
            'Category',
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
    return FutureBuilder(
      future: TagRestService().categoryNames(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildData(context, snapshot.data);
        } else if (snapshot.hasError) {
          return CenterResult.error(
              title: 'Error try to get category names',
              message: snapshot.error.toString());
        }

        return CenterLoading();
      },
    );
  }
}
