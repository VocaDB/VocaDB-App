// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReleaseEvent {
  final String id;

  final String name;

  final DateTime? date;

  final DateTime? endDate;

  final String imageUrl;

  final String? category;

  final String? venueName;
  const ReleaseEvent({
    required this.id,
    required this.name,
    this.date,
    this.endDate,
    required this.imageUrl,
    this.venueName,
    this.category = 'None',
  });
}
