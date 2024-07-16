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
      unitPrices:
          Prices(priceList: unitPrices ?? [], priceType: PriceType.unitPrice),
      tenthPrices: Prices(
        priceList: tenthPrices ?? [],
        priceType: PriceType.tenthPrice,
      ),
      hundredPrices: Prices(
        priceList: hundredPrices ?? [],
        priceType: PriceType.hundredPrice,
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
    final List<Price> array = [];
    if (unitPrices.prices.isNotEmpty) {
      array.add(unitPrices.lastPrice);
    }
    if (tenthPrices.prices.isNotEmpty) {
      array.add(tenthPrices.lastPrice);
    }
    if (hundredPrices.prices.isNotEmpty) {
      array.add(unitPrices.lastPrice);
    }
    return array.where((item) => item.priceValue > 0).toList();
  }
}

Map<PriceType, List<Price>> retrievePricesFromJson({
  required Map<String, dynamic> json,
}) {
  final List<int> unitValueList = _getInt(numbers: json["unit_price"]);
  final List<int> tenthValueList = _getInt(numbers: json["tenth_price"]);
  final List<int> hundredValueList = _getInt(numbers: json["hundred_price"]);
  final List<DateTime> dates = _getDates(json);

  final List<Price> unitPriceList = _generateClearedPriceList(
      values: unitValueList, dates: dates, type: PriceType.unitPrice);
  final List<Price> tenthPriceList = _generateClearedPriceList(
      values: tenthValueList, dates: dates, type: PriceType.tenthPrice);
  final List<Price> hundredPriceList = _generateClearedPriceList(
      values: hundredValueList, dates: dates, type: PriceType.hundredPrice);

  final Map<PriceType, List<Price>> prices = {
    PriceType.unitPrice: unitPriceList,
    PriceType.tenthPrice: tenthPriceList,
    PriceType.hundredPrice: hundredPriceList,
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

List<Price> _priceListGenerator(
    List<int> valueList, List<DateTime> dates, PriceType type) {
  return List<Price>.generate(
    valueList.length,
    (index) => Price(
      priceType: type,
      priceValue: valueList[index],
      scrapDate: dates[index],
    ),
  );
}

List<Price> _clearZeroFromPriceList(List<Price> priceList) {
  return priceList.where((price) => price.priceValue > 0).toList();
}

List<Price> _clearDoubleValuesFromPriceList(List<Price> priceList) {
  if (priceList.isEmpty) return [];
  List<Price> noDoubleValuesPriceList = [priceList.first];
  for (int i = 1; i < priceList.length; i++) {
    if (priceList[i].priceValue != priceList[i - 1].priceValue) {
      noDoubleValuesPriceList.add(priceList[i]);
    }
  }
  return noDoubleValuesPriceList;
}

List<Price> _generateClearedPriceList(
    {required List<int> values,
    required List<DateTime> dates,
    required PriceType type}) {
  final List<Price> priceList = _priceListGenerator(values, dates, type);
  final List<Price> priceListWithoutZero = _clearZeroFromPriceList(priceList);

  return _clearDoubleValuesFromPriceList(priceListWithoutZero);
}
