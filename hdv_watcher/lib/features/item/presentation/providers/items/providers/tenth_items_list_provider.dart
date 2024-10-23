import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/classes/items/tenth_item_list.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/subnotifier/tenth_items_list_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';
import 'package:hdv_watcher/injection_container.dart';

final tenthItemsProvider =
    StateNotifierProvider<TenthItemsNotifier, ItemsListState>((ref) {
  final FetchPaginatedItemsUsecase fetchPaginatedItemsUsecase =
      sl<FetchPaginatedItemsUsecase>();
  return TenthItemsNotifier(
      usecase: fetchPaginatedItemsUsecase, priceType: PriceType.tenth);
});

final validTenthPriceItemsProvider = Provider<TenthItemList>((ref) {
  final state = ref.watch(tenthItemsProvider);
  if (state is Loaded) {
    return TenthItemList(items: state.items);
  }
  return TenthItemList(items: []);
});
