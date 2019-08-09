import 'package:flutter/material.dart';

class ArtistLine extends StatelessWidget {
  final String imageUrl;

  final String name;

  final String role;

  const ArtistLine({Key key, this.imageUrl, this.name, this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
         onTap: () {},
        child: Row(
          children: <Widget>[
            Container(
                height: 38,
                width: 38,
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                child: ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: Image.network(this.imageUrl),
                    ))),
            Container(
              height: 38,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.name, style: Theme.of(context).textTheme.subhead),
                  Container(
                    height: 2,
                  ),
                  Text(this.role, style: Theme.of(context).textTheme.caption),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}