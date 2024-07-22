import 'package:hdv_watcher/core/classes/items/item_list.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class TenthItemList extends ItemList {
  TenthItemList({required super.itemList});

  @override
  List<Item> filterByPricesLength(List<Item> items) {
    return items.where((item) => item.superPrice.tenthPrices.isValid).toList();
  }

  @override
  List<Item> sortByAveragePrice(List<Item> items) {
    return List<Item>.from(items)
      ..sort((a, b) => a.superPrice.tenthPrices.averagePriceValue
          .compareTo(b.superPrice.tenthPrices.averagePriceValue));
  }

  @override
  List<Item> sortByCapitalGain(List<Item> items) {
    return List<Item>.from(items)
      ..sort((a, b) => a.superPrice.tenthPrices.capitalGainPriceValue
          .compareTo(b.superPrice.tenthPrices.capitalGainPriceValue));
  }
}
