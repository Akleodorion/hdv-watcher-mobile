import 'package:hdv_watcher/core/classes/items/item_list.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class UnitItemList extends ItemList {
  UnitItemList({required super.itemList});

  @override
  List<Item> filterByPricesLength(List<Item> items) {
    return items.where((item) => item.superPrice.unitPrices.isValid).toList();
  }

  @override
  List<Item> sortByAveragePrice(List<Item> items) {
    return List<Item>.from(items)
      ..sort((a, b) => a.superPrice.unitPrices.averagePriceValue
          .compareTo(b.superPrice.unitPrices.averagePriceValue));
  }

  @override
  List<Item> sortByCapitalGain(List<Item> items) {
    return List<Item>.from(items)
      ..sort((a, b) => a.superPrice.unitPrices.capitalGainPriceValue
          .compareTo(b.superPrice.unitPrices.capitalGainPriceValue));
  }
}
