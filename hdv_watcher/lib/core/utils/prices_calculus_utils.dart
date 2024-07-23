import 'package:hdv_watcher/core/classes/prices/price.dart';

abstract class PricesCalculusUtils {
  int calculateAveragePriceValue();
  int calculateMedianPrice();
  int calculateCapitalGain();

  int get medianPrice;
  int get averagePrice;
  int get capitalGain;
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
    if (prices.isEmpty) return 0;
    final sortedList = List<Price>.from(prices)
      ..sort((a, b) => a.priceValue.compareTo(b.priceValue));
    final int middle = prices.length ~/ 2;

    if (sortedList.length % 2 == 1) {
      return sortedList[middle].priceValue;
    }
    return (sortedList[middle - 1].priceValue +
            sortedList[middle].priceValue) ~/
        2;
  }

  @override
  int calculateCapitalGain() {
    final int sellingPrice = calculateMedianPrice();
    final int buyingPrice = prices.last.priceValue;
    return sellingPrice - buyingPrice - (sellingPrice * 0.02).round();
  }

  @override
  int get averagePrice => calculateAveragePriceValue();

  @override
  int get capitalGain => calculateCapitalGain();

  @override
  int get medianPrice => calculateMedianPrice();
}
