import 'package:hdv_watcher/core/classes/prices/price.dart';

abstract class PricesEvaluationUtils {
  bool isTradedOftenFunction(int differentValues);
  bool isAvailableFunction();
  bool isWorthFunction();
  bool get isTradedOften;
  bool get isAvailable;
  bool get isWorth;
}

class PricesEvalutionUtilsImpl implements PricesEvaluationUtils {
  final List<Price> prices;
  final List<Price> clearedPrices;
  final int medianPrice;

  PricesEvalutionUtilsImpl({
    required this.prices,
    required this.clearedPrices,
    required this.medianPrice,
  });
  @override
  bool isAvailableFunction() {
    return prices.last.priceValue != 0;
  }

  @override
  bool isTradedOftenFunction(int differentValues) {
    return clearedPrices.length > differentValues;
  }

  @override
  bool isWorthFunction() {
    return medianPrice >
        (prices.last.priceValue + (medianPrice * 0.02).round());
  }

  //! Inserer un constante.
  @override
  bool get isTradedOften => isTradedOftenFunction(10);

  @override
  bool get isAvailable => isAvailableFunction();

  @override
  bool get isWorth => isWorthFunction();
}
