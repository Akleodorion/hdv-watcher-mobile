import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/widgets/item_card.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/widgets/item_list_builder/widgets/item_list_view/widgets/last_list_view_item.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_list_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';

class ItemListView extends StatelessWidget {
  const ItemListView(
      {super.key,
      required this.items,
      required this.priceType,
      required this.stateNotifier});
  final StateNotifierProvider<ItemsListNotifier, ItemsListState> stateNotifier;

  final List<Item> items;
  final PriceType priceType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (BuildContext context, index) {
          if (index == items.length) {
            return LastListViewItem(
              stateNotifier: stateNotifier,
            );
          }
          return ItemCard(
            item: items[index],
            priceType: priceType,
          );
        },
      ),
    );
  }
}
