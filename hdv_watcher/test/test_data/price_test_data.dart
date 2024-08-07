import 'dart:math';

import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

Price priceGenerator(PriceType priceType) {
  return Price(
      priceValue: Random().nextInt(15000),
      priceType: priceType,
      scrapDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - Random().nextInt(32),
      ));
}

final List<Price> tPriceList = [
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
