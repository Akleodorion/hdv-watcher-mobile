import 'package:hdv_watcher/features/item/domain/entities/item.dart';

class RessourceXpList {
  late List<Item> items;

  RessourceXpList(itemList) {
    items = initializeOnlyItemWithXp(items: itemList);
  }

  List<Item> initializeOnlyItemWithXp({required List<Item> items}) {
    return items
        .where((item) =>
            item.fXp >= 50 && (item.xpQuantity < 10 && item.xpQuantity > 0))
        .toList();
  }

  // méthode qui retourne les items dans l'ordre
  List<Item> get sortedList {
    final List<Item> sortedList = [];
    for (final item in items) {
      if (sortedList.isNotEmpty) {
        for (final element in sortedList) {
          if (item.priceToFullXp <= element.priceToFullXp) {
            final idx = sortedList.indexWhere(
                (note) => note.priceToFullXp == element.priceToFullXp);
            sortedList.insert(idx, item);
            break;
          }
          if (element == sortedList.last) {
            sortedList.add(item);
            break;
          }
        }
      }
      sortedList.add(item);
    }
    return sortedList;
  }
}
