abstract class DatesUtils {
  List<DateTime> dateListParser({required List<String> dates});
}

class DatesUtilsImpl implements DatesUtils {
  @override
  List<DateTime> dateListParser({required List<String> dates}) {
    final List<DateTime> parsedDates = [];
    for (final date in dates) {
      try {
        parsedDates.add(
          DateTime.parse(date),
        );
      } on FormatException {
        null;
      }
    }
    return parsedDates;
  }
}
