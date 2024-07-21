import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/classes/items/unit_item_list.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/item/state/item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/item/state/item_state.dart';

import '../../../../../injection_container.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  final FetchItemsUsecase fetchItemsUsecase = sl<FetchItemsUsecase>();

  return ItemNotifier(fetchItemsUsecase: fetchItemsUsecase);
});

final validUnitPriceItemsProvider = Provider<UnitItemList?>((ref) {
  final state = ref.watch(itemProvider);
  if (state is Loaded) {
    return UnitItemList(itemList: state.items);
  }
  return null;
});

final validTenthPriceItemsProvider = Provider<List<Item>>((ref) {
  final List<Item> items = [];
  final state = ref.watch(itemProvider);
  if (state is Loaded) {
    state.items.where((item) => item.superPrice.isTenthPriceValid).toList();
  }
  return items;
});

final validHundredPriceItemsProvider = Provider<List<Item>>((ref) {
  final List<Item> items = [];
  final state = ref.watch(itemProvider);
  if (state is Loaded) {
    state.items.where((item) => item.superPrice.isHundredPriceValid).toList();
  }
  return items;
});
