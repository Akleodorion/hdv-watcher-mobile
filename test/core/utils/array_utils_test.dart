import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/utils/array_utils.dart';

void main() {
  late ArrayUtilsImpl sut;

  setUp(() {
    sut = ArrayUtilsImpl();
  });

  final data = [
    12,
    "25",
    {"herk": 12},
    251,
    1256.56,
  ];
  group('getIntsFromArray', () {
    test('should return a List of integer', () async {
      //act
      final result = sut.getIntsFromArray(data);
      //assert
      final expected = [12, 251];
      expect(result, expected);
    });
  });
}
