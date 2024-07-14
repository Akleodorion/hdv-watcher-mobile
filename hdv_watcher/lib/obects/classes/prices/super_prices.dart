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
    final hundredPrices = prices[PriceType.unitPrice];
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

Map<String, PriceType> priceType = const {
  "unit_price": PriceType.unitPrice,
  "tenth_price": PriceType.tenthPrice,
  "hundred_price": PriceType.hundredPrice,
};

Map<PriceType, List<Price>> retrievePricesFromJson({
  required Map<String, dynamic> json,
}) {
  final Map<PriceType, List<Price>> prices = {
    PriceType.unitPrice: [],
    PriceType.tenthPrice: [],
    PriceType.hundredPrice: [],
  };

  final List<int> unitPriceList = _getInt(numbers: json["unit_price"]);
  final List<int> tenthPriceList = _getInt(numbers: json["tenth_price"]);
  final List<int> hundredPriceList = _getInt(numbers: json["hundred_price"]);
  final List<DateTime> dates = _getDates(json);

  for (var i = 0; i < unitPriceList.length; i++) {
    prices[PriceType.unitPrice]!.add(Price(
      priceType: PriceType.unitPrice,
      priceValue: unitPriceList[i],
      scrapDate: dates[i],
    ));

    prices[PriceType.tenthPrice]!.add(Price(
      priceType: PriceType.tenthPrice,
      priceValue: tenthPriceList[i],
      scrapDate: dates[i],
    ));

    prices[PriceType.hundredPrice]!.add(Price(
      priceType: PriceType.hundredPrice,
      priceValue: hundredPriceList[i],
      scrapDate: dates[i],
    ));
  }

  return prices;
}

List<int> _getInt({required List numbers}) {
  return numbers.map((number) => number as int).toList();
}

List<DateTime> _getDates(json) {
  List dates = json["scrap_date"];
  final parsedDates =
      dates.map((stringDate) => DateTime.parse(stringDate)).toList();
  return parsedDates;
}
