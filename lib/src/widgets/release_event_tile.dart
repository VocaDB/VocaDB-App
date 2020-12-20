import 'package:flutter/material.dart';
import 'package:vocadb_app/widgets.dart';

class ReleaseEventTile extends StatelessWidget {
  final String name;

  final String venueName;

  final String imageUrl;

  final String category;

  final DateTime startDate;

  final DateTime endDate;

  final GestureTapCallback onTap;

  ReleaseEventTile(
      {this.name,
      this.venueName,
      this.imageUrl,
      this.category,
      this.startDate,
      this.endDate,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final String subTitle = (this.venueName.isEmpty)
        ? this.category
        : '${this.category} • ${this.venueName}';

    final String dateRange = (this.startDate == this.endDate)
        ? this.startDate.toIso8601String()
        : '${this.startDate.toString()} - ${this.endDate.toString()}';

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: this.onTap,
          child: Column(
            children: [
              CustomNetworkImage(this.imageUrl),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceDivider.micro(),
                    Text(this.name),
                    SpaceDivider.micro(),
                    Text(subTitle),
                    SpaceDivider.micro(),
                    Text(dateRange)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
