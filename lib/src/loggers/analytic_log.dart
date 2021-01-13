import 'package:firebase_analytics/firebase_analytics.dart';

/// A helper class for logging simple usage such as when user open any detail page for only statistics.
/// No personal data logging here. All data are logged as anonymous.
class AnalyticLog {
  final FirebaseAnalytics analytics;

  final bool enable;

  const AnalyticLog({this.analytics, this.enable = true});

  Future<void> logViewSongDetail(int id) {
    return (enable)
        ? analytics.logSelectContent(contentType: 'song', itemId: id.toString())
        : Future.value();
  }

  Future<void> logViewArtistDetail(int id) {
    return (enable)
        ? analytics.logSelectContent(
            contentType: 'artist', itemId: id.toString())
        : Future.value();
  }

  Future<void> logViewAlbumDetail(int id) {
    return (enable)
        ? analytics.logSelectContent(
            contentType: 'album', itemId: id.toString())
        : Future.value();
  }

  Future<void> logViewReleaseEventDetail(int id) {
    return (enable)
        ? analytics.logSelectContent(
            contentType: 'release_event', itemId: id.toString())
        : Future.value();
  }

  Future<void> logViewTagDetail(int id) {
    return (enable)
        ? analytics.logSelectContent(contentType: 'tag', itemId: id.toString())
        : Future.value();
  }

  Future<void> logLogin() {
    return (enable) ? analytics.logLogin() : Future.value();
  }
}
