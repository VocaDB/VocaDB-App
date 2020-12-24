import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/src/models/release_event_model.dart';
import 'package:vocadb_app/utils.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget to display release event information for horizontal list.
class ReleaseEventTile extends StatelessWidget {
  final String name;

  final String venueName;

  final String imageUrl;

  final String category;

  final DateTime startDate;

  final DateTime endDate;

  final GestureTapCallback onTap;

  /// The height of image preview. Default is 180
  final double imageHeight;

  ReleaseEventTile(
      {this.name,
      this.venueName,
      this.imageUrl,
      this.category,
      this.startDate,
      this.endDate,
      this.onTap,
      this.imageHeight = 180});

  ReleaseEventTile.releaseEvent(ReleaseEventModel releaseEventModel,
      {this.imageHeight = 180, this.onTap})
      : this.name = releaseEventModel.name,
        this.venueName = releaseEventModel.venueName,
        this.imageUrl = releaseEventModel.imageUrl,
        this.category =
            releaseEventModel.category ?? releaseEventModel.eventCategory,
        this.startDate = DateTime.now(),
        this.endDate = null;

  ReleaseEventTile.fromEntry(EntryModel entryModel,
      {this.imageHeight = 180, this.onTap})
      : this.name = entryModel.name,
        this.venueName = null,
        this.imageUrl = entryModel.imageUrl,
        this.category = entryModel.eventCategory,
        this.startDate = null,
        this.endDate = null;

  @override
  Widget build(BuildContext context) {
    final String dateRange = (this.startDate == null)
        ? null
        : (this.endDate == null)
            ? DateTimeUtils.toSimpleFormat(this.startDate)
            : '${DateTimeUtils.toSimpleFormat(this.startDate)} - ${DateTimeUtils.toSimpleFormat(this.endDate)}';

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: this.onTap,
          child: Column(
            children: [
              SizedBox(
                height: imageHeight,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black,
                    ),
                    Container(
                        child: CustomNetworkImage(
                      this.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )),
                    (dateRange == null)
                        ? Container()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Card(
                                color: Colors.black,
                                margin: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    dateRange,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceDivider.micro(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          this.category,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        (this.venueName == null)
                            ? Container()
                            : Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 4.0),
                                    child: Icon(
                                      Icons.place,
                                      size: 12,
                                    ),
                                  ),
                                  Text(
                                    this.venueName,
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              )
                      ],
                    ),
                    SpaceDivider.micro(),
                    Text(
                      this.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SpaceDivider.micro(),
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
