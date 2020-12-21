import 'package:intl/intl.dart';

/// An utility class for manipulate date time value
class DateTimeUtils {
  /// Convert json array value to list
  static String toSimpleFormat(DateTime value) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(value);
  }
}
