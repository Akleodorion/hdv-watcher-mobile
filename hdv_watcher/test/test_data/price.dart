import 'dart:math';

import 'package:hdv_watcher/core/classes/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

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
