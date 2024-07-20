import 'package:hdv_watcher/core/classes/price.dart';
import 'package:hdv_watcher/core/classes/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'price.dart';

Prices pricesGenerator({required PriceType priceType}) {
  var cpt = 0;
  final List<Price> prices = [];
  while (cpt < 10) {
    prices.add(
      priceGenerator(priceType),
    );
    cpt++;
  }

  return Prices(
    prices: prices,
    priceType: priceType,
  );
}

final Prices tUnitPrice = Prices(prices: [
  Price(
    priceValue: 125,
    priceType: PriceType.unitPrice,
    scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
  ),
  Price(
    priceValue: 125,
    priceType: PriceType.unitPrice,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
  Price(
    priceValue: 147,
    priceType: PriceType.unitPrice,
    scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
  ),
  Price(
    priceValue: 158,
    priceType: PriceType.unitPrice,
    scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
  ),
  Price(
    priceValue: 123,
    priceType: PriceType.unitPrice,
    scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
  ),
], priceType: PriceType.unitPrice);

final Prices tTenthPrice = Prices(prices: [
  Price(
    priceValue: 1257,
    priceType: PriceType.tenthPrice,
    scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
  ),
  Price(
    priceValue: 1257,
    priceType: PriceType.tenthPrice,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
  Price(
    priceValue: 1236,
    priceType: PriceType.tenthPrice,
    scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
  ),
  Price(
    priceValue: 1356,
    priceType: PriceType.tenthPrice,
    scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
  ),
  Price(
    priceValue: 1554,
    priceType: PriceType.tenthPrice,
    scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
  ),
], priceType: PriceType.tenthPrice);

final Prices tHundredPrice = Prices(prices: [
  Price(
    priceValue: 12458,
    priceType: PriceType.hundredPrice,
    scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
  ),
  Price(
    priceValue: 12650,
    priceType: PriceType.hundredPrice,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
  Price(
    priceValue: 12385,
    priceType: PriceType.hundredPrice,
    scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
  ),
  Price(
    priceValue: 14523,
    priceType: PriceType.hundredPrice,
    scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00"),
  ),
  Price(
    priceValue: 13256,
    priceType: PriceType.hundredPrice,
    scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00"),
  ),
], priceType: PriceType.hundredPrice);
