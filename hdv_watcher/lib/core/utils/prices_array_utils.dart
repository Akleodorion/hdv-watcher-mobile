import 'package:hdv_watcher/core/classes/prices/price.dart';

abstract class PricesArrayUtils {
  List<Price> sortPricesByValue();
}

class PricesArrayUtilsImpl implements PricesArrayUtils {
  final List<Price> prices;

  PricesArrayUtilsImpl({required this.prices});
  @override
  List<Price> sortPricesByValue() {
    return List<Price>.from(prices)
      ..sort((a, b) => a.priceValue.compareTo(b.priceValue));
  }
}
