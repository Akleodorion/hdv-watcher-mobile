import 'package:hdv_watcher/core/errors/exceptions.dart';

abstract class DatesUtils {
  List<DateTime> dateListParser({required List<dynamic> values});
}

class DatesUtilsImpl implements DatesUtils {
  @override
  List<DateTime> dateListParser({required List<dynamic> values}) {
    try {
      return values.map<DateTime>((value) => DateTime.parse(value)).toList();
    } on FormatException {
      throw UtilException(
          errorMessage:
              "Nous n'avons pas réussi à parser cette date, les valeurs associés seront ignorée.");
    }
  }
}
