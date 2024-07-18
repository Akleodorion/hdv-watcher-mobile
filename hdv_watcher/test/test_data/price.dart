import 'dart:math';

import 'package:hdv_watcher/classes/price_class/price.dart';
import 'package:hdv_watcher/enums/price_type.dart';

Price priceGenerator(PriceType priceType) {
  return Price(
      priceValue: Random().nextInt(15000),
      priceType: priceType,
      scrapDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - Random().nextInt(32),
      ));
}
