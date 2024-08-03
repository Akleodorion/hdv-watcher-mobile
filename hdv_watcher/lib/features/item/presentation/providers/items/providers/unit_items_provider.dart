import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/classes/items/unit_item_list.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/unit_items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';
import 'package:hdv_watcher/injection_container.dart';

final unitItemsProvider =
    StateNotifierProvider<UnitItemsNotifier, ItemState>((ref) {
  final FetchPaginatedItemsUsecase fetchPaginatedItemsUsecase =
      sl<FetchPaginatedItemsUsecase>();

  return UnitItemsNotifier(
      usecase: fetchPaginatedItemsUsecase, priceType: PriceType.unit);
});

final validUnitPriceItemsProvider = Provider<UnitItemList>((ref) {
  final state = ref.watch(unitItemsProvider);
  if (state is Loaded) {
    return UnitItemList(itemList: state.items);
  }
  return UnitItemList(itemList: []);
});
