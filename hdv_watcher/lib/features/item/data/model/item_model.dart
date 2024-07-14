import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';
import 'package:hdv_watcher/obects/classes/prices/super_prices.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.id,
    required super.name,
    required super.imgUrl,
    required super.fXp,
    required super.xpQuantity,
    required super.ressourceType,
    required super.mustBuy,
    required super.superPrices,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"],
      name: json["name"],
      imgUrl: json["img_url"],
      superPrices: SuperPrices.fromJson(json),
      fXp: json["f_xp"],
      xpQuantity: json["xp_quantity"] ?? 0,
      ressourceType: json["ressource_type"],
      mustBuy: json["must_buy"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "img_url": imgUrl,
      "unit_price": superPrices.unitPrices.prices,
      "tenth_price": superPrices.tenthPrices.prices,
      "hundred_price": superPrices.hundredPrices.prices,
      "f_xp": fXp,
      "xp_quantity": xpQuantity,
      "ressource_type": ressourceType,
      "must_buy": mustBuy,
    };
  }
}
