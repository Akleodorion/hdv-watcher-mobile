import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/utils/prices_calculus_utils.dart';

void main() {
  late PricesCalculusUtilsImpl sut;

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
      setUp(() => sut = PricesCalculusUtilsImpl(prices: prices));
      test('should return 138', () async {
        //act
        final result = sut.calculateAveragePriceValue();
        //assert
        expect(result, 138);
      });
    });
  });

  group("calculateMedianPrice", () {
    group(
      "when initial array is empty",
      () {
        setUp(() {
          sut = PricesCalculusUtilsImpl(prices: []);
        });
        test('should return 0', () async {
          //act
          final result = sut.calculateMedianPrice();
          //assert
          expect(result, 0);
        });
      },
    );

    group("When the Price List is good", () {
      group("when the price list length is odd", () {
        final List<Price> sortedPrices = [
          Price(
            priceValue: 123,
            priceType: PriceType.unit,
            scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
          ),
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
            priceValue: 159,
            priceType: PriceType.unit,
            scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
          )
        ];
        setUp(() => sut = PricesCalculusUtilsImpl(prices: sortedPrices));
        test('should return 147', () async {
          //act
          final result = sut.calculateMedianPrice();
          //assert
          expect(result, 147);
        });
      });
      group("when the price list length is even", () {
        final List<Price> sortedPrices = [
          Price(
            priceValue: 123,
            priceType: PriceType.unit,
            scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
          ),
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
        setUp(() => sut = PricesCalculusUtilsImpl(prices: sortedPrices));
        test('should return 136', () async {
          //act
          final result = sut.calculateMedianPrice();
          //assert
          expect(result, 136);
        });
      });
    });
  });

  group("calculateCapitalGain", () {
    final List<Price> sortedPrices = [
      Price(
        priceValue: 123,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
      ),
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
        priceValue: 159,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
      )
    ];
    setUp(() => sut = PricesCalculusUtilsImpl(prices: sortedPrices));
    test('should return -12', () async {
      //act
      final int result = sut.calculateCapitalGain();
      //assert
      expect(
          result,
          147 -
              sortedPrices.last.priceValue -
              (sortedPrices.last.priceValue * 0.02).round());
    });
  });
}
