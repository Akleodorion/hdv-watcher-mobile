import 'package:equatable/equatable.dart';
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

  bool get isUnitPriceValid {
    return unitPrices.cleanedPriceList.length > 15 &&
        unitPrices.prices.last.priceValue != 0;
  }

  bool get isTenthPriceValid {
    return tenthPrices.cleanedPriceList.length > 15 &&
        tenthPrices.prices.last.priceValue != 0;
  }

  bool get isHundredPriceValid {
    return hundredPrices.cleanedPriceList.length > 15 &&
        hundredPrices.prices.last.priceValue != 0;
  }
}
