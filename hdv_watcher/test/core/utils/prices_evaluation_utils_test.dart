import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/utils/prices_evaluation_utils.dart';

void main() {
  late PricesEvalutionUtilsImpl sut;

  group("isAvailable", () {
    group("When the last price is 0", () {
      final List<Price> tPrices = [
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: 0,
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
          priceValue: 158,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
        ),
        Price(
          priceValue: 0,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
        ),
      ];

      setUp(
        () => sut = PricesEvalutionUtilsImpl(
            prices: tPrices, clearedPrices: [], medianPrice: 80),
      );
      test('should return false', () async {
        //act
        final result = sut.isAvailableFunction();
        //assert
        expect(result, false);
      });
    });
    group("When the last price is not zero", () {
      final List<Price> tPrices = [
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: 0,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: 147,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
        ),
      ];

      setUp(
        () => sut = PricesEvalutionUtilsImpl(
            prices: tPrices, clearedPrices: [], medianPrice: 80),
      );
      test('should return false', () async {
        //act
        final result = sut.isAvailableFunction();
        //assert
        expect(result, true);
      });
    });
  });

  group('isTradedOften', () {
    group("When there are not enough values", () {
      final List<Price> tPrices = [
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
      ];
      setUp(() => sut = PricesEvalutionUtilsImpl(
          prices: [], clearedPrices: tPrices, medianPrice: 80));
      test('should return true', () async {
        //act
        final result = sut.isTradedOftenFunction(3);
        //assert
        expect(result, false);
      });
    });
    group("When there are enough values", () {
      final List<Price> tPrices = [
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
      ];
      setUp(() => sut = PricesEvalutionUtilsImpl(
          prices: [], clearedPrices: tPrices, medianPrice: 147));
      test('should return true', () async {
        //act
        final result = sut.isTradedOftenFunction(2);
        //assert
        expect(result, true);
      });
    });
  });

  group("isWorth", () {
    group("when the current price is higher than the median", () {
      final List<Price> tPrices = [
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
      ];
      setUp(() => sut = PricesEvalutionUtilsImpl(
          prices: tPrices, clearedPrices: tPrices, medianPrice: 147));

      test('should return false', () async {
        //act
        final result = sut.isWorthFunction();
        //assert
        expect(result, false);
      });
    });
    group("when the current price is lower than the median ", () {
      final List<Price> tPrices = [
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: 158,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
        ),
        Price(
          priceValue: 147,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
        ),
      ];
      setUp(() => sut = PricesEvalutionUtilsImpl(
          prices: tPrices, clearedPrices: tPrices, medianPrice: 158));

      test('should return false', () async {
        //act
        final result = sut.isWorthFunction();
        //assert
        expect(result, true);
      });
    });
  });
}
