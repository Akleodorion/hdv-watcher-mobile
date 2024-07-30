import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'price_test_data.dart';

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

final Prices tUnitPrice = Prices(prices: unitPrice, priceType: PriceType.unit);

final Prices tTenthPrice =
    Prices(prices: tenthPrice, priceType: PriceType.tenth);

final Prices tHundredPrice =
    Prices(prices: hundredPrice, priceType: PriceType.hundred);

final List<Price> unitPrice = [
  Price(
    priceValue: 0,
    priceType: PriceType.unit,
    scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
  ),
  Price(
    priceValue: 158,
    priceType: PriceType.unit,
    scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
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
];

final List<Price> tenthPrice = [
  Price(
    priceValue: 0,
    priceType: PriceType.tenth,
    scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
  ),
  Price(
    priceValue: 1356,
    priceType: PriceType.tenth,
    scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
  ),
  Price(
    priceValue: 1257,
    priceType: PriceType.tenth,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
  Price(
    priceValue: 1257,
    priceType: PriceType.tenth,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
];

final List<Price> hundredPrice = [
  Price(
    priceValue: 0,
    priceType: PriceType.hundred,
    scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00"),
  ),
  Price(
    priceValue: 12458,
    priceType: PriceType.hundred,
    scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00"),
  ),
  Price(
    priceValue: 12650,
    priceType: PriceType.hundred,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
  Price(
    priceValue: 12385,
    priceType: PriceType.hundred,
    scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00"),
  ),
];
