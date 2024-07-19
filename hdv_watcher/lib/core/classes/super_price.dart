import 'package:hdv_watcher/core/classes/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

class SuperPrice {
  final Prices unitPrices;
  final Prices tenthPrice;
  final Prices hundredPrice;

  SuperPrice({
    required this.unitPrices,
    required this.tenthPrice,
    required this.hundredPrice,
  });

  factory SuperPrice.fromItemFactory({
    required List<int> unitPrices,
    required List<int> tenthPrices,
    required List<int> hundredPrices,
    required List<DateTime> dates,
  }) {
    return SuperPrice(
      unitPrices: Prices.fromSuperPriceFactory(
          values: unitPrices, dates: dates, priceType: PriceType.unitPrice),
      tenthPrice: Prices.fromSuperPriceFactory(
          values: tenthPrices, dates: dates, priceType: PriceType.tenthPrice),
      hundredPrice: Prices.fromSuperPriceFactory(
          values: hundredPrices,
          dates: dates,
          priceType: PriceType.hundredPrice),
    );
  }
}
