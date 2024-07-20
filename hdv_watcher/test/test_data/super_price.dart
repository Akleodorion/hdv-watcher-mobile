import 'package:hdv_watcher/core/classes/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'prices.dart';

SuperPrice superPriceGenerator() {
  return SuperPrice(
    unitPrices: pricesGenerator(priceType: PriceType.unitPrice),
    tenthPrice: pricesGenerator(priceType: PriceType.tenthPrice),
    hundredPrice: pricesGenerator(priceType: PriceType.hundredPrice),
  );
}

final SuperPrice tSuperPrice = SuperPrice(
  unitPrices: tUnitPrice,
  tenthPrice: tTenthPrice,
  hundredPrice: tHundredPrice,
);
