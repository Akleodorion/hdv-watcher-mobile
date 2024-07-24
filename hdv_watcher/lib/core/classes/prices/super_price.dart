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

  factory SuperPrice.fromItemFactory({
    required List<int> unitPrices,
    required List<int> tenthPrices,
    required List<int> hundredPrices,
    required List<DateTime> dates,
  }) {
    return SuperPrice(
      unitPrices: Prices.fromSuperPriceFactory(
          values: unitPrices, dates: dates, priceType: PriceType.unit),
      tenthPrices: Prices.fromSuperPriceFactory(
          values: tenthPrices, dates: dates, priceType: PriceType.tenth),
      hundredPrices: Prices.fromSuperPriceFactory(
          values: hundredPrices, dates: dates, priceType: PriceType.hundred),
    );
  }

  @override
  List<Object?> get props => [
        unitPrices,
        tenthPrices,
        hundredPrices,
      ];

  Map<PriceType, int> get currentPrice {
    return {
      PriceType.unit: unitPrices.currentPrice,
      PriceType.tenth: tenthPrices.currentPrice,
      PriceType.hundred: hundredPrices.currentPrice,
    };
  }

  Map<PriceType, int> get recommandedSellingPrice => {
        PriceType.unit: unitPrices.medianPrice,
        PriceType.tenth: tenthPrices.medianPrice,
        PriceType.hundred: hundredPrices.medianPrice,
      };

  Map<PriceType, int> get averageSellingPrice => {
        PriceType.unit: unitPrices.averagePriceValue,
        PriceType.tenth: tenthPrices.averagePriceValue,
        PriceType.hundred: hundredPrices.averagePriceValue,
      };

  Map<PriceType, List<Price>> get priceList => {
        PriceType.unit: unitPrices.cleanedPriceList,
        PriceType.tenth: tenthPrices.cleanedPriceList,
        PriceType.hundred: hundredPrices.cleanedPriceList,
      };
}
