import 'package:hdv_watcher/obects/Enums/price_type.dart';

class Price {
  final PriceType priceType;
  final int priceValue;
  final DateTime scrapDate;

  const Price({
    required this.priceType,
    required this.priceValue,
    required this.scrapDate,
  });
}
