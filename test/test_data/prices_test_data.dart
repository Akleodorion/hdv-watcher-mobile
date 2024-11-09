import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import 'price_test_data.dart';

Prices pricesGenerator(
    {required PriceType priceType, required int priceQuantity}) {
  final List<Price> prices = [];
  for (var i = priceQuantity; i > 0; i--) {
    prices.add(priceGenerator(priceType: priceType, daysfromToday: i));
  }

  int capitalGain = calculateCapitalGain(
    medianPrice: calculateMedianPrice(prices: prices),
    currentPrice: prices.last.priceValue,
  );

  return Prices(
      prices: prices,
      priceType: priceType,
      medianPrice: calculateMedianPrice(prices: prices),
      currentPrice: prices.last.priceValue,
      capitalGain: capitalGain);
}

int calculateMedianPrice({
  required List<Price> prices,
}) {
  final List<Price> orderedPrices = sortPrices(prices: prices);
  final int middle = (orderedPrices.length / 2).round();
  if (orderedPrices.length % 2 == 1) return orderedPrices[middle].priceValue;
  return ((orderedPrices[middle - 1].priceValue +
          orderedPrices[middle].priceValue) ~/
      2);
}

List<Price> sortPrices({required List<Price> prices}) {
  final List<Price> clonedArray = List.from(prices);
  clonedArray.sort((a, b) => a.priceValue.compareTo(b.priceValue));
  return clonedArray;
}

int calculateCapitalGain(
    {required int medianPrice, required int currentPrice}) {
  return medianPrice - (currentPrice + (medianPrice * 0.02).toInt());
}
