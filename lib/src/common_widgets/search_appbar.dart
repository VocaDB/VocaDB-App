import 'package:flutter/material.dart';

/// A custom appbar widget that allow user perform search
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  // * Keys for testing using find.byKey()
  static const iconClearKey = Key('icon-clear');
  static const iconSearchKey = Key('icon-search');
  static const textTitleKey = Key('text-title');

  const SearchAppBar(
      {super.key,
      this.actions,
      this.showTextInput = false,
      this.onChanged,
      this.onCleared,
      this.onSubmitted,
      this.titleText = 'Search'});

  final List<Widget>? actions;

  /// If value is true, Force display text input when user enter the screen that contain this widget. Default is false
  final bool showTextInput;

  final Function(String)? onChanged;

  final Function(String)? onSubmitted;

  final VoidCallback? onCleared;

  final String titleText;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _textEditingController = TextEditingController();

  late bool showTextInput;

  @override
  void initState() {
    showTextInput = widget.showTextInput;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (showTextInput)
          ? TextField(
              controller: _textEditingController,
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              onSubmitted: (value) {
                if (widget.onSubmitted != null) {
                  widget.onSubmitted!(value);
                }
              },
              autofocus: true,
              style: Theme.of(context).primaryTextTheme.headline6,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
              keyboardType: TextInputType.text,
            )
          : Text(
              widget.titleText,
              key: SearchAppBar.textTitleKey,
            ),
      actions: [
        (showTextInput)
            ? IconButton(
                key: SearchAppBar.iconClearKey,
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _textEditingController.clear();
                  if (widget.onCleared != null) {
                    widget.onCleared!();
                  }
                },
              )
            : IconButton(
                key: SearchAppBar.iconSearchKey,
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    showTextInput = true;
                  });
                },
              ),
        ...?widget.actions,
      ],
    );
  }
}
