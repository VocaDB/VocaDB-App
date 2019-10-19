import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class LikeButton extends StatelessWidget {
  final Function onPressed;
  final bool isLiked;

  const LikeButton({Key key, this.onPressed, this.isLiked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        textColor: (isLiked)
            ? Theme.of(context).accentColor
            : Theme.of(context).iconTheme.color,
        child: Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
            ),
            Text(
                (isLiked)
                    ? FlutterI18n.translate(context, 'label.liked')
                    : FlutterI18n.translate(context, 'label.like'),
                style: TextStyle(fontSize: 12))
          ],
        ));
  }
}
