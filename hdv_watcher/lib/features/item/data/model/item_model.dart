import 'package:hdv_watcher/core/classes/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class ItemModel extends Item {
  const ItemModel(
      {required super.id,
      required super.name,
      required super.imgUrl,
      required super.ressourceType,
      required super.petXp,
      required super.quantityForUnitXp,
      required super.superPrice});

  factory ItemModel.fromJson({required Map<String, dynamic> json}) {
    final List<int> unitPrices =
        retrieveListOfIntFromArray(json: json, priceType: PriceType.unitPrice);
    final List<int> tenthPrices =
        retrieveListOfIntFromArray(json: json, priceType: PriceType.tenthPrice);
    final List<int> hundredPrices = retrieveListOfIntFromArray(
        json: json, priceType: PriceType.hundredPrice);
    final List<DateTime> dates = retrieveDatesFromJson(json: json);

    final String ressourceTypeName = json["item"]["ressource_type"];
    return ItemModel(
      id: json["id"],
      name: json["name"],
      imgUrl: json["img_url"],
      ressourceType: ressourceFromString(name: ressourceTypeName),
      petXp: json["f_xp"],
      quantityForUnitXp: json["xp_quantity"],
      superPrice: SuperPrice.fromItemFactory(
          unitPrices: unitPrices,
          tenthPrices: tenthPrices,
          hundredPrices: hundredPrices,
          dates: dates),
    );
  }
}

List<int> retrieveListOfIntFromArray(
    {required Map<String, dynamic> json, required PriceType priceType}) {
  const typeMap = {
    PriceType.unitPrice: "unit_price",
    PriceType.tenthPrice: "tenth_price",
    PriceType.hundredPrice: "hundred_price"
  };

  List<dynamic> values = json["item"][typeMap[priceType]];
  return values.whereType<int>().toList();
}

List<DateTime> retrieveDatesFromJson({required Map<String, dynamic> json}) {
  List<dynamic> values = json["item"]["scrap_date"];
  return values.map<DateTime>((value) => DateTime.parse(value)).toList();
}
