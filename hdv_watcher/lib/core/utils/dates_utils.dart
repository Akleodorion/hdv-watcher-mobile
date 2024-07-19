abstract class DatesUtils {
  List<DateTime> dateListParser({required List<String> values});
}

class DatesUtilsImpl implements DatesUtils {
  @override
  List<DateTime> dateListParser({required List<String> values}) {
    return values.map<DateTime>((value) => DateTime.parse(value)).toList();
  }
}
