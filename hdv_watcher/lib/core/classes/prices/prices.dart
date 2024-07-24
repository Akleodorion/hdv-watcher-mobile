import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/utils/prices_array_utils.dart';
import 'package:hdv_watcher/core/utils/prices_calculus_utils.dart';
import 'package:hdv_watcher/core/utils/prices_evaluation_utils.dart';

// ignore: must_be_immutable
class Prices extends Equatable {
  final List<Price> prices;
  final PriceType priceType;
  late PricesArrayUtilsImpl _pricesArrayUtilsImpl;
  late PricesCalculusUtilsImpl _pricesCalculusUtilsImpl;
  late PricesEvalutionUtilsImpl _pricesEvalutionUtilsImpl;

  Prices({required this.prices, required this.priceType}) {
    _pricesArrayUtilsImpl = PricesArrayUtilsImpl(prices: prices);
    _pricesCalculusUtilsImpl = PricesCalculusUtilsImpl(prices: prices);
    _pricesEvalutionUtilsImpl = PricesEvalutionUtilsImpl(
        prices: prices,
        clearedPrices: _pricesArrayUtilsImpl.validPriceList,
        medianPrice: _pricesCalculusUtilsImpl.medianPrice);
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
    if (clearedPrices.isEmpty) return false;

    return _pricesEvalutionUtilsImpl.isAvailable &&
        _pricesEvalutionUtilsImpl.isTradedOften &&
        _pricesEvalutionUtilsImpl.isWorth;
  }

  int get currentPrice {
    final filteredList = _pricesArrayUtilsImpl.validPriceList;
    return filteredList.isNotEmpty ? filteredList.last.priceValue : 0;
  }

  List<Price> get cleanedPriceList => _pricesArrayUtilsImpl.validPriceList;

  int get averagePriceValue => _pricesCalculusUtilsImpl.averagePrice;

  int get medianPrice => _pricesCalculusUtilsImpl.medianPrice;

  int get capitalGainPriceValue => _pricesCalculusUtilsImpl.capitalGain;

  @override
  List<Object?> get props => [
        prices,
        priceType,
      ];
}
