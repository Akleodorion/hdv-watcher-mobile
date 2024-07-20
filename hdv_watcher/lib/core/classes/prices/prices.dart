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

  // getters
  List<Price> get cleanedPriceList {
    return _filterUnwantedValueFromList(prices);
  }

  int get averagePriceValue {
    return calculateAveragePriceValue(
        prices: _filterUnwantedValueFromList(prices));
  }

  int get capitalGainPriceValue {
    return calculateCapitalGain(
        sellingPrice: calculateMedianPrice(prices),
        buyingPrice: prices.last.priceValue);
  }

  // méthods

  List<Price> _filterUnwantedValueFromList(List<Price> prices) {
    return _filtersDuplicateFromTheList(
        prices: _filtersZerofromTheList(prices: prices));
  }

  List<Price> _filtersZerofromTheList({required List<Price> prices}) {
    return prices.where((price) => price.priceValue > 0).toList();
  }

  List<Price> _filtersDuplicateFromTheList({required List<Price> prices}) {
    if (prices.isEmpty) return [];
    final List<Price> duplicateLessPriceList = [prices.first];
    for (var i = 1; i < prices.length; i++) {
      if (duplicateLessPriceList.last.priceValue != prices[i].priceValue) {
        duplicateLessPriceList.add(prices[i]);
      }
    }
    return duplicateLessPriceList;
  }

  int calculateAveragePriceValue({required List<Price> prices}) {
    if (prices.isEmpty) {
      throw UtilException(errorMessage: "errorMessage");
    }
    final sum = prices.fold<int>(0, (prev, value) => prev + value.priceValue);
    return (sum ~/ prices.length);
  }

  List<Price> sortPriceListByPriceValue({required List<Price> prices}) {
    return List<Price>.from(prices)
      ..sort((a, b) => a.priceValue.compareTo(b.priceValue));
  }

  int calculateMedianPrice(List<Price> prices) {
    final sortedPriceList = sortPriceListByPriceValue(prices: prices);
    int middle = sortedPriceList.length ~/ 2;
    if (prices.length % 2 == 1) {
      return prices[middle].priceValue;
    } else {
      return (prices[middle - 1].priceValue + prices[middle].priceValue) ~/ 2;
    }
  }

  int calculateCapitalGain(
      {required int sellingPrice, required int buyingPrice}) {
    return sellingPrice - buyingPrice - (0.02 * sellingPrice).round();
  }

  @override
  List<Object?> get props => [
        prices,
        priceType,
      ];
}
