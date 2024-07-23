import 'package:hdv_watcher/core/classes/prices/price.dart';

abstract class PricesEvalutionUtils {
  bool isTradedOften(List<Price> clearedPrices);
  bool isAvailable(List<Price> prices, List<Price> clearedPrices);
  bool isWorth();
}

class PricesEvalutionUtilsImpl implements PricesEvalutionUtils {
  @override
  bool isAvailable(List<Price> prices, List<Price> clearedPrices) {
    // TODO: implement isAvailable
    throw UnimplementedError();
  }

  @override
  bool isTradedOften(List<Price> clearedPrices) {
    // TODO: implement isTradedOften
    throw UnimplementedError();
  }

  @override
  bool isWorth() {
    // TODO: implement isWorth
    throw UnimplementedError();
  }
}
