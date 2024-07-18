import 'package:hdv_watcher/classes/price_class/price.dart';
import 'package:hdv_watcher/classes/price_class/prices.dart';
import 'package:hdv_watcher/enums/price_type.dart';

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
