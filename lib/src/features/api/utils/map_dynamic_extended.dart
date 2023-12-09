extension MapQueryParams on Map<String, dynamic>? {
  Map<String, Object>? get mapAllValuesToString => this?.map((key, value) {
        if (value is List) {
          return MapEntry(key, value.map((e) => e.toString()).toList());
        }

        return MapEntry(key, value.toString());
      });
}
