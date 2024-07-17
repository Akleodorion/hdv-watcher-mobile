import 'package:hdv_watcher/features/item/domain/entities/item.dart';

class RessourceXpList {
  late List<Item> items;

  RessourceXpList({required itemList}) {
    items = initializeOnlyItemWithXp(items: itemList);
  }

  List<Item> initializeOnlyItemWithXp({required List<Item> items}) {
    bool hasValidXp(Item item) {
      return item.fXp >= 1 && item.qtyForUnitXp > 0 && item.qtyFor100Xp < 20000;
    }

    return items.where(hasValidXp).toList();
  }

  // méthode qui retourne les items dans l'ordre
  List<Item> get sortedList {
    final List<Item> sortedList = [];
    for (final item in items) {
      if (sortedList.isEmpty) {
        sortedList.add(item);
        continue;
      }

      for (var element in sortedList) {
        if (item.kamasPerXp <= element.kamasPerXp) {
          final idx = sortedList
              .indexWhere((sortedItem) => sortedItem.id == element.id);
          sortedList.insert(idx, item);
          break;
        }
        if (element.id == sortedList.last.id) {
          sortedList.add(item);
          break;
        }
      }
    }
    return sortedList;
  }

  // Valeurs des croquettes

  Item get croquettes {
    return items.firstWhere((element) => element.name == "Croquette enrichie");
  }
}
