import 'package:flutter/material.dart';
import 'package:vocadb/widgets/action_button.dart';

class LikeActionButton extends ActionButton {
  const LikeActionButton({Key key, bool isLiked = false, Function onTap})
      : super(
            key: key,
            label: (isLiked) ? 'Liked' : 'Like',
            selected: isLiked,
            icon: Icons.favorite,
            onTap: onTap);
}
