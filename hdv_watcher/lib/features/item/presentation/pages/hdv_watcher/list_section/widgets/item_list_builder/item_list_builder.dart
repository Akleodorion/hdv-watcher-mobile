import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/widgets/item_list_builder/functions/routing.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/widgets/item_list_builder/widgets/item_list_loading_page.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

class ItemListBuilder extends ConsumerStatefulWidget {
  const ItemListBuilder({
    super.key,
    required this.provider,
    required this.notifier,
    required this.priceType,
  });

  final StateNotifierProvider<ItemsNotifier, ItemState> notifier;
  final Provider<dynamic> provider;
  final PriceType priceType;
  @override
  ConsumerState<ItemListBuilder> createState() => _ItemListBuilderState();
}

class _ItemListBuilderState extends ConsumerState<ItemListBuilder> {
  Future<ItemState> _itemState() async {
    final ItemState state = ref.watch(widget.notifier);
    return state;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _itemState(),
      builder: (context, snapshot) {
        final List<Item> items = ref.read(widget.provider).sortedPriceList;
        return snapshot.hasData
            ? routing(snapshot.data!, items, widget.priceType, widget.notifier)
            : const ItemListLoadingPage();
      },
    );
  }
}
