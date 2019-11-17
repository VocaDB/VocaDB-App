import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/models/tag_model.dart';

class TagStreamFilters extends StatelessWidget {
  final Function onBrowseTags;
  final Stream tags$;
  final Function onDeleteTag;

  const TagStreamFilters(
      {Key key, this.onBrowseTags, this.tags$, this.onDeleteTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            FlutterI18n.translate(context, 'label.tags'),
          ),
        ),
        StreamBuilder(
          stream: tags$,
          builder: (context, snapshot) {
            List<TagModel> tags = (snapshot.hasData)
                ? (snapshot.data as Map<int, TagModel>).values.toList()
                : [];

            if (tags.length == 0) return Container();

            return Column(
              children: tags
                  .map((tag) => ListTile(
                        leading: Icon(Icons.label),
                        title: Text(tag.name),
                        trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              onDeleteTag(tag);
                            }),
                      ))
                  .toList(),
            );
          },
        ),
        ListTile(
          onTap: () {
            this.onBrowseTags();
          },
          leading: Icon(Icons.add),
          title: Text('ADD TAG'),
        ),
      ],
    );
  }
}
