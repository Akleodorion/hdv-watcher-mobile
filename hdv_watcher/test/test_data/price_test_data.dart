import 'dart:math';

import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

Map<PriceType, int> priceRange = {
  PriceType.unit: 100,
  PriceType.tenth: 1000,
  PriceType.hundred: 10000,
};

Price priceGenerator({
  required PriceType priceType,
  required int daysfromToday,
}) {
  return Price(
      priceValue:
          Random().nextInt(priceRange[priceType]!) + priceRange[priceType]!,
      priceType: priceType,
      scrapDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - daysfromToday,
      ));
}
