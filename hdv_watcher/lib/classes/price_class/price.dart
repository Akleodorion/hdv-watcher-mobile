import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/enums/price_type.dart';

class Price extends Equatable {
  final int priceValue;
  final PriceType priceType;
  final DateTime scrapDate;

  const Price({
    required this.priceValue,
    required this.priceType,
    required this.scrapDate,
  });

  @override
  List<Object?> get props => [
        priceType,
        priceType,
        scrapDate,
      ];
}
