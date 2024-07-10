import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.id,
    required super.name,
    required super.imgUrl,
    required super.scrapDate,
    required super.unitPrice,
    required super.tenthPrice,
    required super.hundredPrice,
    required super.fXp,
    required super.xpQuantity,
    required super.ressourceType,
    required super.mustBuy,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"],
      name: json["name"],
      imgUrl: json["img_url"],
      scrapDate: json["scrap_date"],
      unitPrice: json["unit_price"],
      tenthPrice: json["tenth_price"],
      hundredPrice: json["hundred_price"],
      fXp: json["f_xp"],
      xpQuantity: json["xp_quantity"],
      ressourceType: json["ressource_type"],
      mustBuy: json["must_buy"],
    );
  }

  Map<String,dynamic> toJson() {

    return {
      "id": id,
      "name": name,
      "img_url": imgUrl,
      "scrap_date": scrapDate,
      "unit_price": unitPrice,
      "tenth_price": tenthPrice,
      "hundred_price": hundredPrice,
      "f_xp": fXp,
      "xp_quantity": xpQuantity,
      "ressource_type": ressourceType,
      "must_buy": mustBuy,
    };
  }

}
