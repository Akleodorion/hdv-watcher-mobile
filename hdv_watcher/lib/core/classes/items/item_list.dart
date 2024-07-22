import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class ItemList {
  late List<Item> items;
  ItemList({
    required List<Item> itemList,
  }) {
    items = initPriceList(itemList);
  }

  List<Item> initPriceList(List<Item> items) {
    return filterByPricesLength(items);
  }

  List<Item> get sortedPriceList {
    return sortByCapitalGain(items).reversed.toList();
  }

  List<Item> filterByPricesLength(List<Item> items) {
    return items.where((item) => true).toList();
  }

  List<Item> sortByAveragePrice(List<Item> items) {
    return List<Item>.from(items)..sort();
  }

  List<Item> sortByCapitalGain(List<Item> items) {
    return List<Item>.from(items)..sort();
  }
}
