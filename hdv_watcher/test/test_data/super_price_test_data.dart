import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'prices_test_data.dart';

SuperPrice superPriceGenerator({required int priceQuantity}) {
  return SuperPrice(
    unitPrices: pricesGenerator(
        priceType: PriceType.unit, priceQuantity: priceQuantity),
    tenthPrices: pricesGenerator(
        priceType: PriceType.tenth, priceQuantity: priceQuantity),
    hundredPrices: pricesGenerator(
        priceType: PriceType.hundred, priceQuantity: priceQuantity),
  );
}
