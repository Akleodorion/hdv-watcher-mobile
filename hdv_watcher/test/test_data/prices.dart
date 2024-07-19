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
