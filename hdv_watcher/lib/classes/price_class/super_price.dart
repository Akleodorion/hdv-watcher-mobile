import 'package:hdv_watcher/classes/price_class/prices.dart';

class SuperPrice {
  final Prices unitPrices;
  final Prices tenthPrice;
  final Prices hundredPrice;

  SuperPrice({
    required this.unitPrices,
    required this.tenthPrice,
    required this.hundredPrice,
  });
}
