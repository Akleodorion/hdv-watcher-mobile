import 'package:hdv_watcher/features/item/domain/entities/item.dart';

class RessourceXpList {
  late List<Item> items;

  RessourceXpList(itemList) {
    items = initialiseOnlyFxpItem(items: itemList);
  }

  List<Item> initialiseOnlyFxpItem( {required List<Item> items}) {
    return items.where((item) =>  item.fXp > 0).toList();
  }

  // méthode qui retourne les items dans l'ordre
  List<Item> sortedItems() {
    return [];
  }
}