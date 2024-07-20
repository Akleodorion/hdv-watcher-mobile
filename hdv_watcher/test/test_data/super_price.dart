import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'prices.dart';

SuperPrice superPriceGenerator() {
  return SuperPrice(
    unitPrices: pricesGenerator(priceType: PriceType.unitPrice),
    tenthPrices: pricesGenerator(priceType: PriceType.tenthPrice),
    hundredPrices: pricesGenerator(priceType: PriceType.hundredPrice),
  );
}

final SuperPrice tSuperPrice = SuperPrice(
  unitPrices: tUnitPrice,
  tenthPrices: tTenthPrice,
  hundredPrices: tHundredPrice,
);
