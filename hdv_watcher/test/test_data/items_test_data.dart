import 'dart:math';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'super_price_test_data.dart';

Item itemGenerator({required String name, required int priceQuantity}) {
  final int ressourceTypeLength = RessourceType.values.length;
  return Item(
    id: Random().nextInt(15000),
    name: name,
    imgUrl: "imgUrl",
    ressourceType: RessourceType.values[Random().nextInt(ressourceTypeLength)],
    superPrice: superPriceGenerator(priceQuantity: priceQuantity),
    isLoaded: true,
  );
}
