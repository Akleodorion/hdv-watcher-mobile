import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';

abstract class PricesArrayUtils {
  List<Price> removePriceWhereValueIsZero(List<Price> prices);
  List<Price> removePriceWhereValueIsSameToPrevious(List<Price> prices);
  List<Price> sortPricesByValue(List<Price> prices);
  int retrieveMaxValue(List<Price> prices);
  int retrieveMinValue(List<Price> prices);
  get validPriceList;
  get sortedPriceList;
}

class PricesArrayUtilsImpl implements PricesArrayUtils {
  final List<Price> prices;

  PricesArrayUtilsImpl({required this.prices});
  @override
  List<Price> removePriceWhereValueIsSameToPrevious(prices) {
    if (prices.isEmpty) return [];
    final List<Price> doubleLessArray = [prices[0]];
    for (var i = 1; i < prices.length; i++) {
      doubleLessArray.last.priceValue == prices[i].priceValue
          ? null
          : doubleLessArray.add(prices[i]);
    }
    return doubleLessArray;
  }

  @override
  List<Price> removePriceWhereValueIsZero(prices) {
    return prices.where((element) => element.priceValue != 0).toList();
  }

  @override
  List<Price> sortPricesByValue(List<Price> prices) {
    return List<Price>.from(prices)
      ..sort((a, b) => a.priceValue.compareTo(b.priceValue));
  }

  @override
  int retrieveMaxValue(prices) {
    return prices
        .reduce((value, element) =>
            value.priceValue < element.priceValue ? element : value)
        .priceValue;
  }

  @override
  int retrieveMinValue(prices) {
    return prices.reduce((value, element) {
      if (value.priceValue <= 0 || element.priceValue <= 0) {
        throw UtilException(
            errorMessage: "Une valeure est inférieur ou égale à 0");
      }
      return value.priceValue > element.priceValue ? element : value;
    }).priceValue;
  }

  @override
  List<Price> get validPriceList {
    final zeroLessArray = removePriceWhereValueIsZero(prices);
    final doubleLessArray =
        removePriceWhereValueIsSameToPrevious(zeroLessArray);
    return doubleLessArray;
  }

  @override
  get sortedPriceList {
    final zeroLessArray = removePriceWhereValueIsZero(prices);
    final doubleLessArray =
        removePriceWhereValueIsSameToPrevious(zeroLessArray);
    return sortPricesByValue(doubleLessArray);
  }
}
