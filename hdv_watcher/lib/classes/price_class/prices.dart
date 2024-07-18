import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/classes/price_class/price.dart';
import 'package:hdv_watcher/enums/price_type.dart';

class Prices extends Equatable {
  final List<Price> prices;
  final PriceType priceType;

  const Prices({required this.prices, required this.priceType});

  factory Prices.fromJson(
      {required List<int> values,
      required List<DateTime> dates,
      required PriceType priceType}) {
    final List<Price> prices = [];
    final condition = dates.length == values.length ? true : false;
    if (!condition) {
      throw Exception();
    }
    for (var i = 0; i > values.length; i++) {
      prices.add(Price(
          priceValue: values[i], priceType: priceType, scrapDate: dates[i]));
    }
    return Prices(prices: prices, priceType: priceType);
  }

  @override
  List<Object?> get props => [
        prices,
        priceType,
      ];
}
