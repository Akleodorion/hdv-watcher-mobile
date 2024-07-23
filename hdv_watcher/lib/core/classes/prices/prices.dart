import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/utils/prices_array_utils.dart';
import 'package:hdv_watcher/core/utils/prices_calculus_utils.dart';

// ignore: must_be_immutable
class Prices extends Equatable {
  late List<Price> prices;
  late PriceType priceType;
  late PricesArrayUtilsImpl _pricesArrayUtilsImpl;
  late PricesCalculusUtilsImpl _pricesCalculusUtilsImpl;

  Prices({required this.prices, required this.priceType}) {
    prices = prices;
    priceType = priceType;
    _pricesArrayUtilsImpl = PricesArrayUtilsImpl(prices: prices);
    _pricesCalculusUtilsImpl = PricesCalculusUtilsImpl(prices: prices);
  }

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
    final clearedPrices = _pricesArrayUtilsImpl.validPriceList;
    if (clearedPrices.isEmpty) {
      return false;
    }
    return _isAvailable(prices, clearedPrices) &&
        _isTradedOften(clearedPrices) &&
        _isWorth();
  }

  int get currentPrice {
    final filteredList = _pricesArrayUtilsImpl.validPriceList;
    return filteredList.isNotEmpty ? filteredList.last.priceValue : 0;
  }

  List<Price> get cleanedPriceList {
    return _pricesArrayUtilsImpl.validPriceList;
  }

  int get averagePriceValue {
    return _pricesCalculusUtilsImpl.averagePrice;
  }

  int get medianPrice {
    return _pricesCalculusUtilsImpl.medianPrice;
  }

  int get capitalGainPriceValue {
    return _pricesCalculusUtilsImpl.capitalGain;
  }

  // Méthodes
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

  @override
  List<Object?> get props =>
      [prices, priceType, _pricesArrayUtilsImpl, _pricesCalculusUtilsImpl];
}
