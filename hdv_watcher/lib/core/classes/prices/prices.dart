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
  final int medianPrice;
  final int capitalGain;
  final int currentPrice;
  late PricesArrayUtilsImpl _pricesArrayUtilsImpl;
  late PricesCalculusUtilsImpl _pricesCalculusUtilsImpl;
  late PricesEvalutionUtilsImpl _pricesEvalutionUtilsImpl;

  Prices(
      {required this.prices,
      required this.priceType,
      required this.capitalGain,
      required this.currentPrice,
      required this.medianPrice}) {
    _pricesArrayUtilsImpl = PricesArrayUtilsImpl(prices: prices);
    _pricesCalculusUtilsImpl = PricesCalculusUtilsImpl(prices: prices);
    _pricesEvalutionUtilsImpl = PricesEvalutionUtilsImpl(
        prices: prices,
        clearedPrices: _pricesArrayUtilsImpl.validPriceList,
        medianPrice: _pricesCalculusUtilsImpl.medianPrice);
  }

  factory Prices.fromJson({
    required Map<String, dynamic> priceInfoJson,
    required PriceType priceType,
  }) {
    final List<Price> prices = List.generate(
      priceInfoJson["price_list"].length,
      (i) => Price(
        priceValue: priceInfoJson["price_list"][i]["price"] as int,
        scrapDate: DateTime.parse(priceInfoJson["price_list"][i]["scrap_date"]),
        priceType: priceType,
      ),
    );

    return Prices(
      prices: prices,
      priceType: priceType,
      medianPrice: priceInfoJson["median_price"],
      capitalGain: priceInfoJson["capital_gain"],
      currentPrice: priceInfoJson["current_price"],
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

  List<Price> get cleanedPriceList => _pricesArrayUtilsImpl.validPriceList;

  int get averagePriceValue => _pricesCalculusUtilsImpl.averagePrice;

  int get capitalGainPriceValue => _pricesCalculusUtilsImpl.capitalGain;

  @override
  List<Object?> get props => [
        prices,
        priceType,
      ];
}
