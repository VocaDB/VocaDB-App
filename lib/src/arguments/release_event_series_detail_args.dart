import 'package:vocadb_app/models.dart';

class ReleaseEventSeriesDetailArgs {
  /// An id of release event.
  final int id;

  /// Optional release event series data for pre-display before fetch.
  final ReleaseEventSeriesModel eventSeries;

  const ReleaseEventSeriesDetailArgs({this.id, this.eventSeries});
}
