import 'package:hdv_watcher/core/classes/super_price.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/core/utils/array_utils.dart';
import 'package:hdv_watcher/core/utils/dates_utils.dart';
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

  factory ItemModel.fromJson({
    required Map<String, dynamic> json,
    required DatesUtils datesUtils,
    required ArrayUtils arrayUtils,
  }) {
    final List<int> unitPrices =
        arrayUtils.getIntsFromArray(json["unit_price"]);
    final List<int> tenthPrices =
        arrayUtils.getIntsFromArray(json["tenth_price"]);
    final List<int> hundredPrices =
        arrayUtils.getIntsFromArray(json["hundred_price"]);

    final List<DateTime> dates =
        datesUtils.dateListParser(values: json["scrap_date"]);

    final String ressourceTypeName = json["ressource_type"];
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
