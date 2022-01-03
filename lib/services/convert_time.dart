import 'package:intl/intl.dart';

class ConvertTime {
  final DateFormat _dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  DateFormat readableFormat = DateFormat("EEE, dd MMM yyyy");

  String getReadableDate(DateTime? date) {
    return readableFormat.format(date!);
  }

  String calculateAge(DateTime? birthDay) {
    return "${DateTime.now().difference(birthDay!).inDays ~/ 365}";
  }
}
