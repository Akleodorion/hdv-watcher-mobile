import 'package:hdv_watcher/obects/Enums/price_type.dart';
import 'package:hdv_watcher/obects/classes/prices/price.dart';
import 'package:hdv_watcher/obects/classes/prices/prices.dart';

class SuperPrices {
  final Prices unitPrices;
  final Prices tenthPrices;
  final Prices hundredPrices;

  SuperPrices({
    required this.unitPrices,
    required this.tenthPrices,
    required this.hundredPrices,
  });

  factory SuperPrices.fromJson(Map<String, dynamic> json) {
    final Map<PriceType, List<Price>> prices =
        retrievePricesFromJson(json: json);
    final unitPrices = prices[PriceType.unitPrice];
    final tenthPrices = prices[PriceType.tenthPrice];
    final hundredPrices = prices[PriceType.hundredPrice];
    return SuperPrices(
      unitPrices: Prices(
        priceList: unitPrices ?? [],
      ),
      tenthPrices: Prices(
        priceList: tenthPrices ?? [],
      ),
      hundredPrices: Prices(
        priceList: hundredPrices ?? [],
      ),
    );
  }

  // récupére le prix le plus bas parmis les 3 price liste.
  Price get lowerPrice {
    Price? price = _retriveLowerPrice();
    if (price == null) {
      throw Error();
    }
    return price;
  }

  Price? _retriveLowerPrice() {
    final array = _retrieveValidLastPrice();
    if (array.isNotEmpty) {
      return array.fold(
        array[0],
        (previous, current) => current.unitPrice <= previous!.unitPrice
            ? previous = current
            : previous,
      );
    }
    return null;
  }

  List<Price> _retrieveValidLastPrice() {
    final List<Price> array = [
      unitPrices.lastPrice,
      tenthPrices.lastPrice,
      hundredPrices.lastPrice
    ];
    return array.where((item) => item.priceValue > 0).toList();
  }
}

Map<PriceType, List<Price>> retrievePricesFromJson({
  required Map<String, dynamic> json,
}) {
  final List<int> unitPriceList = _getInt(numbers: json["unit_price"]);
  final List<int> tenthPriceList = _getInt(numbers: json["tenth_price"]);
  final List<int> hundredPriceList = _getInt(numbers: json["hundred_price"]);
  final List<DateTime> dates = _getDates(json);

  final Map<PriceType, List<Price>> prices = {
    PriceType.unitPrice: List<Price>.generate(
        unitPriceList.length,
        (index) => Price(
              priceType: PriceType.unitPrice,
              priceValue: unitPriceList[index],
              scrapDate: dates[index],
            )),
    PriceType.tenthPrice: List<Price>.generate(
        tenthPriceList.length,
        (index) => Price(
              priceType: PriceType.tenthPrice,
              priceValue: tenthPriceList[index],
              scrapDate: dates[index],
            )),
    PriceType.hundredPrice: List<Price>.generate(
        hundredPriceList.length,
        (index) => Price(
              priceType: PriceType.hundredPrice,
              priceValue: hundredPriceList[index],
              scrapDate: dates[index],
            )),
  };

  return prices;
}

List<int> _getInt({required List numbers}) {
  return List<int>.from(numbers.map((number) => number as int));
}

List<DateTime> _getDates(json) {
  List<dynamic> dates = json["scrap_date"];
  return List<DateTime>.from(
      dates.map((stringDate) => DateTime.parse(stringDate)));
}
