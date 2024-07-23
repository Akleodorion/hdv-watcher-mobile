import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/utils/prices_array_utils.dart';

import '../../test_data/prices_test_data.dart';

void main() {
  late PricesArrayUtilsImpl sut;

  setUp(() => sut = PricesArrayUtilsImpl(
        prices: tUnitPrice.prices,
      ));

  group("Retrieve Max Value", () {
    // initialisation
    final List<Price> tPrices = [
      Price(
        priceValue: 125,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
      ),
      Price(
        priceValue: 125,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
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
      )
    ];

    test('should return 158', () async {
      //act
      final result = sut.retrieveMaxValue(tPrices);
      //assert
      expect(result, 158);
    });
  });

  group("Retrieve Min Value", () {
    group("When a value is not valid", () {
      // init
      final List<Price> tPrices = [
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: -2,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
        ),
        Price(
          priceValue: 0,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
        ),
        Price(
          priceValue: 158,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
        )
      ];

      test('should throw a UtilsException', () async {
        //assert
        expect(
            () => sut.retrieveMinValue(tPrices), throwsA(isA<UtilException>()));
      });
    });

    group("when the list has only positive values", () {
      final List<Price> tPrices = [
        Price(
          priceValue: 125,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
        ),
        Price(
          priceValue: 132,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
        ),
        Price(
          priceValue: 127,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
        ),
        Price(
          priceValue: 158,
          priceType: PriceType.unit,
          scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
        )
      ];
      const int expectedAnswer = 125;

      test('should return 125', () async {
        //act
        final result = sut.retrieveMinValue(tPrices);
        //assert
        expect(result, expectedAnswer);
      });
    });
  });

  group("removePriceWhereValueIsSameToPrevious", () {
    final List<Price> expected = [
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
        priceValue: 125,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
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
        priceValue: 0,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T21:02:36.610+00:00"),
      ),
      Price(
        priceValue: 123,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
      ),
    ];
    test('should return a List without consecutive doubles', () async {
      //act
      final result =
          sut.removePriceWhereValueIsSameToPrevious(tUnitPrice.prices);
      //assert
      expect(result, expected);
    });
  });

  group("removePriceWhereValueIsZero", () {
    final List<Price> expected = [
      Price(
        priceValue: 125,
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
    test('should return a valid price list without 0', () async {
      //act
      final result = sut.removePriceWhereValueIsZero(tUnitPrice.prices);
      //assert
      expect(result, expected);
    });
  });

  group("sortPricesByValue", () {
    final List<Price> expected = [
      Price(
        priceValue: 0,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
      ),
      Price(
        priceValue: 0,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T21:02:36.610+00:00"),
      ),
      Price(
        priceValue: 0,
        priceType: PriceType.unit,
        scrapDate: DateTime.parse("2024-07-14T21:02:36.610+00:00"),
      ),
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

    test('should return a sortedList', () async {
      //act
      final result = sut.sortPricesByValue(tUnitPrice.prices);
      //assert
      expect(result, expected);
    });
  });

  group("validPriceList", () {
    final List<Price> expected = [
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
    test('should return a valid price list', () async {
      //act
      final result = sut.validPriceList;
      //assert
      expect(result, expected);
    });
  });

  group("sortedPriceList", () {
    final List<Price> expected = [
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
    test('should return a valid price list', () async {
      //act
      final result = sut.sortedPriceList;
      //assert
      expect(result, expected);
    });
  });
}
