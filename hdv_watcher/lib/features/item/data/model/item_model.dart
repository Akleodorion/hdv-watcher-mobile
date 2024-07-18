import 'package:hdv_watcher/classes/price_class/super_price.dart';
import 'package:hdv_watcher/enums/ressource_type.dart';
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
    return ItemModel(
      id: json["id"],
      name: json["id"],
      imgUrl: json["id"],
      ressourceType: ressourceTypeFromJson(json: json["item"]),
      petXp: json["id"],
      quantityForUnitXp: json["id"],
      superPrice: SuperPrice.fromJson(json: json),
    );
  }
}
