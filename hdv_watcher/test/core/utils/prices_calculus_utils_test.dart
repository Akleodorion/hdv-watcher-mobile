import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/utils/prices_calculus_utils.dart';

void main() {
  late PricesCalculusUtilsImpl sut;

  setUp(() {
    final List<Price> prices = [
      Price(
        priceValue: 125,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
      ),
      Price(
        priceValue: 147,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
      ),
      Price(
        priceValue: 158,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
      ),
      Price(
        priceValue: 123,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
      ),
    ];
    sut = PricesCalculusUtilsImpl(prices: prices);
  });
  group("calculateAveragePriceValue", () {
    group("When the initial array is empty", () {
      setUp(() {
        final List<Price> prices = [];
        sut = PricesCalculusUtilsImpl(prices: prices);
      });

      test('should return 0 ', () async {
        //act
        final result = sut.calculateAveragePriceValue();
        //assert
        expect(result, 0);
      });
    });

    group("When the initial array is not Empty", () {
      test('should return 138', () async {
        //act
        final result = sut.calculateAveragePriceValue();
        //assert
        expect(result, 138);
      });
    });
  });

  group("calculateMedianPrice", () {});
}
