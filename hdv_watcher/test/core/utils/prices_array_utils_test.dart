import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/utils/prices_array_utils.dart';

void main() {
  late PricesArrayUtilsImpl sut;

  setUp(() => sut = PricesArrayUtilsImpl(prices: [
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
        ),
        Price(
          priceValue: 0,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
        ),
        Price(
          priceValue: 158,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
        ),
      ]));

  group("sortPricesByValue", () {
    final List<Price> expected = [
      Price(
        priceValue: 0,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
      ),
      Price(
        priceValue: 125,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
      ),
      Price(
        priceValue: 125,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
      ),
      Price(
        priceValue: 158,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
      ),
    ];
    test('should return a sortedList', () async {
      //act
      final result = sut.sortPricesByValue();
      //assert
      expect(result, expected);
    });
  });
}
