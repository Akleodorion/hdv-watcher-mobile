import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

class Prices extends Equatable {
  final List<Price> prices;
  final PriceType priceType;

  const Prices({required this.prices, required this.priceType});

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

  @override
  List<Object?> get props => [
        prices,
        priceType,
      ];
}
