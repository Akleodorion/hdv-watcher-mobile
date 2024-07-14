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
    return SuperPrices(
      unitPrices: Prices(
        priceList: retrievePricesFromJson(
            json: json, type: "unit_price", priceType: priceType),
      ),
      tenthPrices: Prices(
        priceList: retrievePricesFromJson(
            json: json, type: "tenth_price", priceType: priceType),
      ),
      hundredPrices: Prices(
        priceList: retrievePricesFromJson(
            json: json, type: "hundred_price", priceType: priceType),
      ),
    );
  }
}

Map<String, PriceType> priceType = const {
  "unit_price": PriceType.unitPrice,
  "tenth_price": PriceType.tenthPrice,
  "hundred_price": PriceType.hundredPrice,
};

List<Price> retrievePricesFromJson({
  required Map<String, dynamic> json,
  required String type,
  required priceType,
}) {
  var id = 0;
  final List<Price> prices = [];

  final List<int> dataList = _getInt(numbers: json[type]);
  for (final data in dataList) {
    prices.add(Price(
        priceType: priceType[type] ?? PriceType.unknown,
        priceValue: data,
        scrapDate: _getDates(json)[id]));
    id++;
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
