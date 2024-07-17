import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/obects/Enums/price_type.dart';

class Price extends Equatable {
  final PriceType priceType;
  final int priceValue;
  final DateTime scrapDate;

  const Price({
    required this.priceType,
    required this.priceValue,
    required this.scrapDate,
  });

  int get unitPrice {
    return _retrieveUnitPrice();
  }

  int _retrieveUnitPrice() {
    final Map<PriceType, int> map = {
      PriceType.unitPrice: priceValue,
      PriceType.tenthPrice:
          (priceValue / 10).round() == 0 ? 1 : (priceValue / 10).round(),
      PriceType.hundredPrice:
          (priceValue / 10).round() == 0 ? 1 : (priceValue / 10).round(),
    };
    return map[priceType]!;
  }

  @override
  List<Object?> get props => [
        priceType,
        priceValue,
        scrapDate,
      ];
}
