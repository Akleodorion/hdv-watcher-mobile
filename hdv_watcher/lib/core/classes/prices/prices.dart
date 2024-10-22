import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

// ignore: must_be_immutable
class Prices extends Equatable {
  final List<Price> prices;
  final PriceType priceType;
  final int medianPrice;
  final int capitalGain;
  final int currentPrice;

  const Prices({
    required this.prices,
    required this.priceType,
    required this.capitalGain,
    required this.currentPrice,
    required this.medianPrice,
  });

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

  @override
  List<Object?> get props => [
        prices,
        priceType,
        medianPrice,
        capitalGain,
        currentPrice,
      ];
}
