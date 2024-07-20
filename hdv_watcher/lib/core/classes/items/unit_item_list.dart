import 'package:hdv_watcher/core/classes/items/item_list.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class UnitItemList extends ItemList {
  late List<Item> items;
  UnitItemList({
    required List<Item> itemList,
  }) {
    items = initPriceList(itemList);
  }

  @override
  List<Item> filterByPricesLength(List<Item> items) {
    return items
        .where(
            (item) => item.superPrice.unitPrices.cleanedPriceList.length > 140)
        .toList();
  }

  @override
  List<Item> initPriceList(List<Item> items) {
    return filterByPricesLength(items);
  }

  List<Item> get sortedPriceList {
    return sortByCapitalGain(items);
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
