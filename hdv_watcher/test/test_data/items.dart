import 'dart:math';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/features/item/data/model/item_model.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'super_price.dart';

Item itemGenerator({required String name}) {
  final int ressourceTypeLength = RessourceType.values.length;
  return Item(
    id: Random().nextInt(15000),
    name: name,
    imgUrl: "imgUrl",
    ressourceType: RessourceType.values[Random().nextInt(ressourceTypeLength)],
    petXp: Random().nextInt(40),
    quantityForUnitXp: 1,
    superPrice: superPriceGenerator(),
  );
}

final ItemModel tItem = ItemModel(
    id: 10250,
    name: "Œil de Crowneille",
    imgUrl: "https://api.dofusdb.fr/img/items/109326.png",
    ressourceType: RessourceType.oeil,
    petXp: 1,
    quantityForUnitXp: 1,
    superPrice: tSuperPrice);
