import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'prices_test_data.dart';

SuperPrice superPriceGenerator() {
  return SuperPrice(
    unitPrices: pricesGenerator(priceType: PriceType.unit),
    tenthPrices: pricesGenerator(priceType: PriceType.tenth),
    hundredPrices: pricesGenerator(priceType: PriceType.hundred),
  );
}

final SuperPrice tSuperPrice = SuperPrice(
  unitPrices: tUnitPrice,
  tenthPrices: tTenthPrice,
  hundredPrices: tHundredPrice,
);
