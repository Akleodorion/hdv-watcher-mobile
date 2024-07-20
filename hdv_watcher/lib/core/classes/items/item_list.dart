import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

abstract class ItemList {
  List<Item> initPriceList(List<Item> items);
  List<Item> filterByPricesLength(List<Item> items);
  List<Item> sortByCapitalGain(List<Item> items);
  List<Item> sortByAveragePrice(List<Item> items);
}
