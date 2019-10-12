class JSONUtils {
  static List<T> mapJsonArray<T>(List jsonArray, Function map) {
    return (jsonArray == null) ? [] : jsonArray.map((v) => map(v) as T).toList();
  }
}