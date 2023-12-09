class ApiQueryResult {
  final List<dynamic> items;
  final int totalCount;

  const ApiQueryResult({
    this.items = const [],
    this.totalCount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
      'totalCount': totalCount,
    };
  }

  factory ApiQueryResult.fromMap(Map<String, dynamic> map) {
    return ApiQueryResult(
      items: map['items'] as List<dynamic>,
      totalCount: map['totalCount'] as int,
    );
  }
}
