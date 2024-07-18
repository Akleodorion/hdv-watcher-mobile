import 'package:hdv_watcher/classes/price_class/prices.dart';
import 'package:hdv_watcher/enums/price_type.dart';

class SuperPrice {
  final Prices unitPrices;
  final Prices tenthPrice;
  final Prices hundredPrice;

  SuperPrice({
    required this.unitPrices,
    required this.tenthPrice,
    required this.hundredPrice,
  });

  factory SuperPrice.fromJson({required Map<String, dynamic> json}) {
    List<int> unitValues =
        retrivePriceValuesFromJson(json: json, priceType: PriceType.unitPrice);
    List<int> tenthValues =
        retrivePriceValuesFromJson(json: json, priceType: PriceType.tenthPrice);
    List<int> hundredValues = retrivePriceValuesFromJson(
        json: json, priceType: PriceType.hundredPrice);

    final List<DateTime> dates = retrieveDatesFromJson(json: json);

    return SuperPrice(
      unitPrices: Prices.fromJson(
          values: unitValues, dates: dates, priceType: PriceType.unitPrice),
      tenthPrice: Prices.fromJson(
          values: tenthValues, dates: dates, priceType: PriceType.tenthPrice),
      hundredPrice: Prices.fromJson(
          values: hundredValues,
          dates: dates,
          priceType: PriceType.hundredPrice),
    );
  }
}

List<int> retrivePriceValuesFromJson(
    {required Map<String, dynamic> json, required PriceType priceType}) {
  const typeMap = {
    PriceType.unitPrice: "unit_price",
    PriceType.tenthPrice: "tenth_price",
    PriceType.hundredPrice: "hundred_price"
  };
  final List<int> data = [];
  List<dynamic> values = json["item"][typeMap[priceType]];
  for (final value in values) {
    value is int ? data.add(value) : null;
  }
  return data;
}

List<DateTime> retrieveDatesFromJson({required Map<String, dynamic> json}) {
  final List<DateTime> dates = [];
  List<dynamic> values = json["item"]["scrap_date"];
  for (final value in values) {
    dates.add(DateTime.parse(value));
  }
  return dates;
}
