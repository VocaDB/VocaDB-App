import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) {
        return Center(child: ErrorMessageWidget(e.toString()));
      },
      loading: () {
        return loadingWidget;
      },
    );
  }
}
