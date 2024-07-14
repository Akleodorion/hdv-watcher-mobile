import 'package:hdv_watcher/obects/Enums/price_type.dart';
import 'package:hdv_watcher/obects/classes/prices/price.dart';

class Prices {
  late List<Price> prices;
  late PriceType priceType;
  Prices({required List<Price> priceList}) {
    prices = priceList;
    priceType = initializePriceType(priceList);
  }

  PriceType initializePriceType(List<Price> priceList) {
    return priceList.first.priceType;
  }

  Price get lastPrice {
    return prices.last;
  }

  // Etablis le prix de
}
