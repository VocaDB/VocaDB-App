/// An utility class for manipulate json value
class JSONUtils {
  /// Convert json array value to list
  static List<T> mapJsonArray<T>(List jsonArray, Function map) {
    return (jsonArray == null)
        ? []
        : jsonArray.map((v) => map(v) as T).toList();
  }
}
