import 'package:hdv_watcher/obects/Enums/price_type.dart';
import 'package:hdv_watcher/obects/classes/prices/price.dart';

class Prices {
  late List<Price> prices;
  late PriceType priceType;
  Prices({required List<Price> priceList}) {
    prices = priceList;
    priceType = initializePriceType(priceList);
  }

  PriceType initializePriceType(List<Price> priceList) {
    return priceList.first.priceType;
  }

  Price get lastPrice {
    return prices.last;
  }

  // ignore: unused_element
  int _calculateAveragePrice(List<Price> priceList) {
    final int total = priceList.fold(0, (p, n) => p + n.priceValue);
    return priceList.isEmpty ? 0 : (total / priceList.length).round();
  }

  int _calculateMedianPrice(List<Price> filteredPrice) {
    int middle = filteredPrice.length ~/ 2;
    if (filteredPrice.isEmpty || filteredPrice.length < 5) {
      return 0;
    }
    if (filteredPrice.length % 2 == 1) {
      return filteredPrice[middle].priceValue;
    } else {
      return ((filteredPrice[middle - 1].priceValue +
                  filteredPrice[middle].priceValue) /
              2)
          .round();
    }
  }

  get optimalSellingPrice {
    final List<Price> cleanedList = _filterPricesBy0(prices);
    final List<Price> doubleLessArray = _cleanSamePrice(cleanedList);
    final List<Price> filteredList = _filterOutliers(doubleLessArray);
    return _calculateMedianPrice(filteredList);
  }

  List<Price> _cleanSamePrice(List<Price> priceList) {
    final List<Price> noDoubleArray =
        priceList.fold<List<Price>>([], (prev, actual) {
      if (prev.isNotEmpty && prev.last.priceValue == actual.priceValue) {
        return prev;
      } else {
        prev.add(actual);
        return prev;
      }
    });
    return noDoubleArray;
  }

  List<Price> _filterOutliers(List<Price> priceList) {
    if (priceList.isEmpty || priceList.length < 5) {
      return [];
    }
    final int q1 = priceList[(priceList.length / 4).round()].priceValue;
    late int q3;
    if ((3 * priceList.length / 4).round() < priceList.length) {
      q3 = priceList[(3 * priceList.length / 4).round()].priceValue;
    } else {
      q3 = priceList[(3 * priceList.length / 4).round() - 1].priceValue;
    }
    final int iqr = q1 * q3;

    double lowerBound = q1 - 1.5 * iqr;
    double upperBound = q3 + 1.5 * iqr;

    return priceList
        .where((price) =>
            price.priceValue >= lowerBound && price.priceValue <= upperBound)
        .toList();
  }

  List<Price> _filterPricesBy0(List<Price> priceList) {
    return priceList.where((value) => value.priceValue > 0).toList();
  }

  List<Price> sortListByPriceValue(List<Price> priceList) {
    final List<Price> sortedPrices = List<Price>.from(prices);
    sortedPrices.sort((a, b) => a.priceValue.compareTo(b.priceValue));
    return sortedPrices;
  }
}
