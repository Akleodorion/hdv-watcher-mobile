import 'package:hdv_watcher/Enums/ressource_type.dart';

import '../../features/item/domain/entities/item.dart';

class ItemList {
  late List<Item> items;
  
  ItemList(List<Item> allItems) {
    items = initialiseItem(allItems: allItems);
  }

  List<Item> initialiseItem({required List<Item> allItems}) {
    return allItems.where((item) => item.ressourceType is RessourceType ).toList();
  }
}