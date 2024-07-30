import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/classes/items/hundred_item_list.dart';
import 'package:hdv_watcher/core/classes/items/unit_item_list.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

import '../../../../../core/classes/items/tenth_item_list.dart';
import '../../../../../injection_container.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  final FetchItemsUsecase fetchItemsUsecase = sl<FetchItemsUsecase>();

  return ItemNotifier(fetchItemsUsecase: fetchItemsUsecase);
});

final validUnitPriceItemsProvider = Provider<UnitItemList>((ref) {
  final state = ref.watch(itemProvider);
  if (state is Loaded) {
    return UnitItemList(itemList: state.items);
  }
  return UnitItemList(itemList: []);
});

final validTenthPriceItemsProvider = Provider<TenthItemList>((ref) {
  final state = ref.watch(itemProvider);
  if (state is Loaded) {
    return TenthItemList(itemList: state.items);
  }
  return TenthItemList(itemList: []);
});

final validHundredPriceItemsProvider = Provider<HundredItemList>((ref) {
  final state = ref.watch(itemProvider);
  if (state is Loaded) {
    return HundredItemList(itemList: state.items);
  }
  return HundredItemList(itemList: []);
});
