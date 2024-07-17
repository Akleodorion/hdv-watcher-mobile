import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/classes/price_class/price.dart';
import 'package:hdv_watcher/enums/price_type.dart';

class Prices extends Equatable {
  final List<Price> prices;
  final PriceType priceType;

  const Prices({required this.prices, required this.priceType});

  @override
  List<Object?> get props => [
        prices,
        priceType,
      ];
}
