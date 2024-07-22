import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';

class Prices extends Equatable {
  final List<Price> prices;
  final PriceType priceType;

  const Prices({required this.prices, required this.priceType});

  factory Prices.fromSuperPriceFactory({
    required List<int> values,
    required List<DateTime> dates,
    required PriceType priceType,
  }) {
    if (values.length != dates.length) {
      throw Exception('Values and dates lists must have the same length.');
    }

    final List<Price> prices = List.generate(
      values.length,
      (i) => Price(
        priceValue: values[i],
        priceType: priceType,
        scrapDate: dates[i],
      ),
    );

    return Prices(
      prices: prices,
      priceType: priceType,
    );
  }

  // Getters
  bool get isValid {
    final clearedPrices = _filterUnwantedValueFromList(prices);
    if (clearedPrices.isEmpty) {
      return false;
    }
    return _isAvailable(prices, clearedPrices) &&
        _isTradedOften(clearedPrices) &&
        _isWorth();
  }

  int get currentPrice {
    final filteredList = _filterUnwantedValueFromList(prices);
    return filteredList.isNotEmpty ? filteredList.last.priceValue : 0;
  }

  List<Price> get cleanedPriceList {
    return _filterUnwantedValueFromList(prices);
  }

  int get averagePriceValue {
    return calculateAveragePriceValue(
        prices: _filterUnwantedValueFromList(prices));
  }

  int get medianPrice {
    try {
      return calculateMedianPrice(_filterUnwantedValueFromList(prices));
    } on UtilException {
      return 0;
    }
  }

  int get capitalGainPriceValue {
    return calculateCapitalGain(
        sellingPrice: calculateMedianPrice(prices),
        buyingPrice: prices.last.priceValue);
  }

  // Méthodes
  List<Price> _filterUnwantedValueFromList(List<Price> prices) {
    final filteredPrices =
        prices.where((price) => price.priceValue > 0).toList();
    return _removeDuplicates(filteredPrices);
  }

  List<Price> _removeDuplicates(List<Price> prices) {
    if (prices.isEmpty) return [];
    final List<Price> result = [prices.first];
    for (var i = 1; i < prices.length; i++) {
      if (result.last.priceValue != prices[i].priceValue) {
        result.add(prices[i]);
      }
    }
    return result;
  }

  bool _isTradedOften(List<Price> clearedPrices) {
    return clearedPrices.length > 80;
  }

  bool _isAvailable(List<Price> prices, List<Price> clearedPrices) {
    return prices.isNotEmpty &&
        clearedPrices.isNotEmpty &&
        prices.last.scrapDate == clearedPrices.last.scrapDate;
  }

  bool _isWorth() {
    return medianPrice > currentPrice;
  }

  int calculateAveragePriceValue({required List<Price> prices}) {
    if (prices.isEmpty) {
      throw UtilException(errorMessage: "errorMessage");
    }
    final sum = prices.fold<int>(0, (prev, value) => prev + value.priceValue);
    return sum ~/ prices.length;
  }

  int calculateMedianPrice(List<Price> prices) {
    if (prices.isEmpty) {
      throw UtilException(errorMessage: "errorMessage");
    }
    final sortedPrices = List<Price>.from(prices)
      ..sort((a, b) => a.priceValue.compareTo(b.priceValue));
    final middle = sortedPrices.length ~/ 2;
    if (sortedPrices.length % 2 == 1) {
      return sortedPrices[middle].priceValue;
    } else {
      return (sortedPrices[middle - 1].priceValue +
              sortedPrices[middle].priceValue) ~/
          2;
    }
  }

  int calculateCapitalGain(
      {required int sellingPrice, required int buyingPrice}) {
    return sellingPrice - buyingPrice - (0.02 * sellingPrice).round();
  }

  @override
  List<Object?> get props => [prices, priceType];
}
