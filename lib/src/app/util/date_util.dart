import 'package:intl/intl.dart';

class DateUtil {
  static String formatHour(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('HH:mm').format(dateTime);
  }
}
