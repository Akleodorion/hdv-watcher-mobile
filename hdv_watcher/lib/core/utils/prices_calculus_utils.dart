import 'package:hdv_watcher/core/classes/prices/price.dart';

abstract class PricesCalculusUtils {
  int calculateAveragePriceValue();
  int calculateMedianPrice();
  int calculateCapitalGain(int sellingPrice, int buyingPrice);
}

class PricesCalculusUtilsImpl implements PricesCalculusUtils {
  final List<Price> prices;

  PricesCalculusUtilsImpl({required this.prices});
  @override
  int calculateAveragePriceValue() {
    if (prices.isEmpty) return 0;
    final sum = prices.fold<int>(0, (prev, value) => prev + value.priceValue);
    return sum ~/ prices.length;
  }

  @override
  int calculateMedianPrice() {
    // TODO: implement calculateMedianPrice
    throw UnimplementedError();
  }

  @override
  int calculateCapitalGain(int sellingPrice, int buyingPrice) {
    // TODO: implement calculateCapitalGain
    throw UnimplementedError();
  }
}
