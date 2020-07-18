import 'package:flutter/material.dart';
import 'package:vocadb/shared_widgets/result.dart';

class CenterResult extends StatelessWidget {
  final Result result;

  const CenterResult({Key key, this.result}) : super(key: key);

  CenterResult.error({Key key, String title = 'Error!', String message})
      : result = Result.error(title, subtitle: message),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return result;
  }
}

class CenterLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
