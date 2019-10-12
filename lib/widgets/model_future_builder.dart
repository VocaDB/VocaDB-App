import 'dart:async';

import 'package:flutter/material.dart';

class ModelFutureBuilder<T> extends StatelessWidget {
  final Function buildData;
  final Function buildError;
  final Function buildLoading;
  final Future<T> future;

  const ModelFutureBuilder(
      {Key key,
      this.buildData,
      this.buildError,
      this.buildLoading,
      this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildData(snapshot.data);
        else if (snapshot.hasError) {
          return buildError(snapshot.error);
        }
        return buildLoading();
      },
    );
  }
}
