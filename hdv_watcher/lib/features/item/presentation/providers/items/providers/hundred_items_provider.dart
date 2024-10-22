import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/classes/items/hundred_item_list.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/hundred_items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';
import 'package:hdv_watcher/injection_container.dart';

final hundredItemsProvider =
    StateNotifierProvider<HundredItemsNotifier, ItemState>((ref) {
  final FetchPaginatedItemsUsecase fetchPaginatedItemsUsecase =
      sl<FetchPaginatedItemsUsecase>();
  return HundredItemsNotifier(
      usecase: fetchPaginatedItemsUsecase, priceType: PriceType.hundred);
});

final validHundredPriceItemsProvider = Provider<HundredItemList>((ref) {
  final state = ref.watch(hundredItemsProvider);
  if (state is Loaded) {
    return HundredItemList(items: state.items);
  }
  return HundredItemList(items: []);
});
