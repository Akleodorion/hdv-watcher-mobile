import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/obects/classes/items/item_list.dart';
import 'package:hdv_watcher/obects/classes/items/ressource_xp_list.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';
import 'package:hdv_watcher/features/item/domain/usecases/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item/state/fetch_item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item/state/fetch_item_state.dart';

import '../../../../injection_container.dart';

final fetchItemsProvider =
    StateNotifierProvider<FetchItemNotifier, FetchItemState>((ref) {
  final FetchItemsUsecase fetchItemsUsecase = sl<FetchItemsUsecase>();
  return FetchItemNotifier(fetchItemsUsecase: fetchItemsUsecase);
});

final allItemsProvider = Provider<List<Item>>((ref) {
  final state = ref.watch(fetchItemsProvider);
  if (state is Loaded) {
    return state.items;
  }
  return [];
});

final ressourceItemsProvider = Provider((ref) {
  final allItems = ref.read(allItemsProvider);
  return ItemList(allItems);
});

final fXpListProvider = Provider((ref) {
  final allItems = ref.read(allItemsProvider);
  return RessourceXpList(itemList: allItems);
});
