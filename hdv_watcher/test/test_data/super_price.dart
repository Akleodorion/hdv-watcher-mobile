import 'package:hdv_watcher/classes/price_class/super_price.dart';
import 'package:hdv_watcher/enums/price_type.dart';

import 'prices.dart';

SuperPrice superPriceGenerator() {
  return SuperPrice(
    unitPrices: pricesGenerator(priceType: PriceType.unitPrice),
    tenthPrice: pricesGenerator(priceType: PriceType.tenthPrice),
    hundredPrice: pricesGenerator(priceType: PriceType.hundredPrice),
  );
}
