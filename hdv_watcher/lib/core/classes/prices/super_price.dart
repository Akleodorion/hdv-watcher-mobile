import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

class SuperPrice extends Equatable {
  final Prices unitPrices;
  final Prices tenthPrices;
  final Prices hundredPrices;

  const SuperPrice({
    required this.unitPrices,
    required this.tenthPrices,
    required this.hundredPrices,
  });

  factory SuperPrice.fromJson({
    required Map<String, dynamic> unitPricesInfoJson,
    required Map<String, dynamic> tenthPricesInfoJson,
    required Map<String, dynamic> hundredPricesInfoJson,
  }) {
    return SuperPrice(
      unitPrices: Prices.fromJson(
          priceInfoJson: unitPricesInfoJson, priceType: PriceType.unit),
      tenthPrices: Prices.fromJson(
          priceInfoJson: tenthPricesInfoJson, priceType: PriceType.tenth),
      hundredPrices: Prices.fromJson(
          priceInfoJson: hundredPricesInfoJson, priceType: PriceType.hundred),
    );
  }

  @override
  List<Object?> get props => [
        unitPrices,
        tenthPrices,
        hundredPrices,
      ];

  Map<PriceType, int> get capitalGain => {
        PriceType.unit: unitPrices.capitalGain,
        PriceType.tenth: unitPrices.capitalGain,
        PriceType.hundred: unitPrices.capitalGain,
      };

  Map<PriceType, int> get currentPrice => {
        PriceType.unit: unitPrices.currentPrice,
        PriceType.tenth: unitPrices.currentPrice,
        PriceType.hundred: unitPrices.currentPrice,
      };

  Map<PriceType, int> get averageSellingPrice => {
        PriceType.unit: unitPrices.medianPrice,
        PriceType.tenth: tenthPrices.medianPrice,
        PriceType.hundred: hundredPrices.medianPrice,
      };

  Map<PriceType, int> get recommandedSellingPrice => {
        PriceType.unit: unitPrices.medianPrice,
        PriceType.tenth: tenthPrices.medianPrice,
        PriceType.hundred: hundredPrices.medianPrice,
      };

  Map<PriceType, List<Price>> get priceList => {
        PriceType.unit: unitPrices.prices,
        PriceType.tenth: tenthPrices.prices,
        PriceType.hundred: hundredPrices.prices,
      };
}
