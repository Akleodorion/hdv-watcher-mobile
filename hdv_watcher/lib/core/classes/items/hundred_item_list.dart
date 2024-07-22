import 'package:hdv_watcher/core/classes/items/item_list.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class HundredItemList extends ItemList {
  HundredItemList({required super.itemList});

  @override
  List<Item> filterByPricesLength(List<Item> items) {
    return items
        .where((item) => item.superPrice.hundredPrices.isValid)
        .toList();
  }

  @override
  List<Item> sortByAveragePrice(List<Item> items) {
    return List<Item>.from(items)
      ..sort((a, b) => a.superPrice.hundredPrices.averagePriceValue
          .compareTo(b.superPrice.hundredPrices.averagePriceValue));
  }

  @override
  List<Item> sortByCapitalGain(List<Item> items) {
    return List<Item>.from(items)
      ..sort((a, b) => a.superPrice.hundredPrices.capitalGainPriceValue
          .compareTo(b.superPrice.hundredPrices.capitalGainPriceValue));
  }
}
