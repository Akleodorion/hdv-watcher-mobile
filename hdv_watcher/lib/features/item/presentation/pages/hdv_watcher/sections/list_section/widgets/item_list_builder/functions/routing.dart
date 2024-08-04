import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_list_builder/widgets/item_list_loading_page.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_list_builder/widgets/item_list_unloaded.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_list_builder/widgets/item_list_view.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

Widget routing(ItemState state, List<Item> items, PriceType priceType,
    StateNotifierProvider<ItemsNotifier, ItemState> notifier) {
  // Unloaded
  if (state is Unloaded) {
    return ItemListUnloaded(
      stateNotifier: notifier,
    );
  }
  // Loading
  if (state is Loading) {
    return const ItemListLoadingPage();
  }

  return ItemListView(items: items, priceType: priceType);
}
