import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class ItemModel extends Item {
  const ItemModel(
      {required super.id,
      required super.name,
      required super.imgUrl,
      required super.ressourceType,
      required super.superPrice});

  factory ItemModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    final String ressourceTypeName = json["ressource_type"];
    return ItemModel(
      id: json["id"],
      name: json["name"],
      imgUrl: json["img_url"],
      ressourceType: ressourceFromString(name: ressourceTypeName),
      superPrice: SuperPrice.fromJson(
        unitPricesInfoJson: json["unit_price_info"],
        tenthPricesInfoJson: json["tenth_price_info"],
        hundredPricesInfoJson: json["hundred_price_info"],
      ),
    );
  }
}
