import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/utils/dates_utils.dart';

void main() {
  late DatesUtilsImpl sut;

  setUp(() {
    sut = DatesUtilsImpl();
  });

  group("dateListParser", () {
    group("When the list is good", () {
      List<DateTime> dates = [
        DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        DateTime.parse("2024-07-14T17:02:31.617+00:00"),
        DateTime.parse("2024-07-14T18:02:34.031+00:00"),
      ];
      List<String> values = [
        "2024-07-14T15:02:34.954+00:00",
        "2024-07-14T17:02:31.617+00:00",
        "2024-07-14T18:02:34.031+00:00",
      ];
      test('should return a valid list of dates', () async {
        //act
        final result = sut.dateListParser(values: values);
        //assert
        expect(result, dates);
      });
    });

    group("When the list is not good", () {
      List<String> values = [
        "2024-07-14T15:02:34.954+00:00",
        "12/24/12",
        "2024-07-14T18:02:34.031+00:00",
      ];
      test('should throw a UtilException', () async {
        //assert
        expect(() => sut.dateListParser(values: values),
            throwsA(isA<UtilException>()));
      });
    });
  });
}
